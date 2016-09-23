class Admin::IndicatorsController < Admin::BaseController
  before_action :require_login

  def new
    @indicator = Indicator.new
  end

  def create
    @indicator = Indicator.new(name: params[:name])

    if @indicator.save
      @indicator.update(display_name: SecureRandom.hex(5))
      tags = params[:indicator][:tags]
      tags.each do |tag_name|
        if tag_name != ""
          @indicator.tags << Tag.find_by(name: tag_name)
        end
      end

      redirect_to admin_indicator_path(@indicator)
    else
      flash[:error] = @indicator.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @indicators = Indicator.all
  end

  def show
    @indicator = Indicator.find_by(display_name: params[:display_name])
    @related_countries = Country.all
    @related_topics = [Topic.find_by(title: "Global Oil Consumption"), Topic.find_by(title: "Global Oil Production")]
  end

  def destroy
    indicator = Indicator.find_by(display_name: params[:display_name])
    indicator.tags.clear
    indicator.destroy
    flash[:success] = "Indicator deleted!"
    redirect_to admin_indicators_path
  end
end

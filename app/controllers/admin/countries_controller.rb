class Admin::CountriesController < Admin::BaseController
  # before_action :require_login

  def new
    @country = Country.new
  end

  def create
    params[:name].downcase!
    @country = Country.new(name: params[:name])

    if @country.save
      tags = params[:country][:tags]
      tags.each do |tag_name|
        if tag_name != ""
          @country.tags << Tag.find_by(name: tag_name)
        end
      end

      redirect_to @country
    else
      flash[:error] = @country.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @countries = Country.all
  end

  def show
    country_name = params[:name].split("-").join(" ")
    @country = Country.find_by(name: country_name)
  end

  def destroy
    country_name = params[:name].split("-").join(" ")
    country = Country.find_by(name: country_name)
    country.tags.clear
    country.destroy
    flash[:success] = "Country deleted!"
    redirect_to admin_countries_path
  end
end

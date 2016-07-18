class Admin::TagsController < Admin::BaseController
  before_action :require_login

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(name: params[:name])
    if @tag.save
      @tag.update(display_name: SecureRandom.hex(10))
      flash[:success] = "Tag successfully created!"
      redirect_to admin_tags_path
    else
      flash[:error] = @tag.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @tags = Tag.all
  end

  def destroy
    tag = Tag.find_by(id: params[:id])
    tag.topics.clear
    tag.indicators.clear
    tag.previews.clear
    tag.countries.clear
    tag.destroy
    flash[:success] = "Tag deleted!"
    redirect_to admin_tags_path
  end
end

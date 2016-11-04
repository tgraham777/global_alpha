class Admin::PreviewsController < Admin::BaseController
  before_action :require_login, except: [:show, :index]

  def new
    @preview = Preview.new
  end

  def create
    @preview = Preview.new(title: params[:title])

    if @preview.save
      @preview.update(display_name: SecureRandom.hex(5))
      tags = params[:preview][:tags]
      tags.each do |tag_name|
        if tag_name != ""
          @preview.tags << Tag.find_by(name: tag_name)
        end
      end

      redirect_to admin_preview_path(@preview)
    else
      flash[:error] = @preview.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @previews = Preview.all
  end

  def show
    @preview = Preview.find_by(title: params[:title])
  end

  def destroy
    preview = Preview.find_by(title: params[:title])
    preview.tags.clear
    preview.destroy
    flash[:success] = "Preview deleted!"
    redirect_to admin_previews_path
  end
end

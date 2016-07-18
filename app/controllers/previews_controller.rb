class PreviewsController < ApplicationController
  # before_action :require_login, except: [:show]

  def new
    @preview = Preview.new
  end

  def create
    params[:name].downcase!
    @preview = Preview.new(name: params[:name])

    if @preview.save
      tags = params[:preview][:tags]
      tags.each do |tag_name|
        if tag_name != ""
          @preview.tags << Tag.find_by(name: tag_name)
        end
      end

      redirect_to @preview
    else
      flash[:error] = @preview.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @previews = Preview.all
  end

  def show
    preview_name = params[:name].split("-").join(" ")
    @preview = Preview.find_by(name: preview_name)
  end

  def destroy
    preview_name = params[:name].split("-").join(" ")
    preview = Preview.find_by(name: preview_name)
    preview.tags.clear
    preview.destroy
    flash[:success] = "Preview deleted!"
    redirect_to previews_path
  end
end

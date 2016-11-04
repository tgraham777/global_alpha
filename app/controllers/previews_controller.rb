class PreviewsController < ApplicationController
  def index
    @previews = Preview.all
  end

  def show
    @preview = Preview.find_by(display_name: params[:display_name])
  end
end

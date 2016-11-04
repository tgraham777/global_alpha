class PreviewsController < ApplicationController
  def index
    @previews = Preview.all
  end

  def show
    @preview = Preview.find_by(title: params[:title])
  end
end

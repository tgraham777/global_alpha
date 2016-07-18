class PreviewsController < ApplicationController
  before_action :require_login, except: [:show]

  def index
    @previews = Preview.all
  end

  def show
    @preview = Preview.find_by(display_name: params[:display_name])
  end
end

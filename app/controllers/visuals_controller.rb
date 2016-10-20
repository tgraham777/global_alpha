class VisualsController < ApplicationController
  before_action :require_login

  def show
    @visual = Visual.find_by(display_name: params[:display_name])
  end
end

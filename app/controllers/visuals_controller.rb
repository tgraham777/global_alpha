class VisualsController < ApplicationController
  def show
    @visual = Visual.find_by(display_name: params[:display_name])
  end
end

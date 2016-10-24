class Admin::VisualsController < Admin::BaseController
  before_action :require_login

  def show
    @visual = Visual.find_by(display_name: params[:display_name])
  end

  def edit
    @visual = Visual.find_by(display_name: params[:display_name])
  end

  def update
    @visual = Visual.find_by(display_name: params[:display_name])
    if @visual.update(visual_params)
      flash[:success] = "Visual was updated successfully!"
      redirect_to admin_visual_path(@visual)
    else
      flash[:error] = @visual.errors.full_messages.first
      redirect_to edit_admin_visual_path(@visual)
    end
  end

private
  def visual_params
    params.require(:visual).permit(:title, :link, :caption, :description, :additional_description)
  end
end

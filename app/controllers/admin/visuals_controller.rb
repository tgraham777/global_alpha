class Admin::VisualsController < Admin::BaseController
  before_action :require_login

  def index
    @visuals = Visual.all.sort_by(&:updated_at).reverse!
  end

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

  def destroy
    visual = Visual.find_by(display_name: params[:display_name])
    visual.countries.clear
    visual.topics.clear
    visual.destroy
    flash[:success] = "Visual deleted!"
    redirect_to admin_visuals_path
  end

private
  def visual_params
    params.require(:visual).permit(:title, :link, :caption, :description, :additional_description)
  end
end

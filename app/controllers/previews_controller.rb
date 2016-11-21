class PreviewsController < ApplicationController
  def index
    @previews = Preview.all.sort_by(&:updated_at).reverse!
  end

  def show
    @preview = Preview.find_by(display_name: params[:display_name])
    @visuals = @preview.visuals.sort
    @related_previews = @preview.tags.sample.previews.reject{ |preview| preview.title == @preview.title }.sort_by(&:updated_at).last(2).reverse!
  end
end

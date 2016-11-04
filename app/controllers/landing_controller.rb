class LandingController < ApplicationController
  def show
  end

  def index
    @fm_preview = Preview.find_by(title: "Financial Markets")
    @gm_preview = Preview.find_by(title: "Global Macro")
    @ht_preview = Preview.find_by(title: "Hot Topic")
  end
end

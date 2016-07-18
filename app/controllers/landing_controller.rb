class LandingController < ApplicationController
  def show
  end

  def index
    @fm_preview = Preview.find_by(name: "Financial Markets")
    @gm_preview = Preview.find_by(name: "Global Macro")
    @ht_preview = Preview.find_by(name: "Hot Topic")
  end
end

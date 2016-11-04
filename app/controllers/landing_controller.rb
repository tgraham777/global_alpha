class LandingController < ApplicationController
  def show
  end

  def index
    @first_preview = Preview.find_by(title: "Hot Topic")
    @second_preview = Preview.find_by(title: "Global Macro")
    @third_preview = Preview.find_by(title: "Financial Markets")
  end
end

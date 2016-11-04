class LandingController < ApplicationController
  def show
  end

  def index
    @first_preview = Preview.find_by(title: "The Global Oil Market")
    @second_preview = Preview.find_by(title: "The Global Oil Market")
    @third_preview = Preview.find_by(title: "The Global Oil Market")
  end
end

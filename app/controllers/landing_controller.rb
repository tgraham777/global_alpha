class LandingController < ApplicationController
  def show
  end

  def index
    @first_preview = Preview.find_by(title: "Emerging Markets Debt")
    @second_preview = Preview.find_by(title: "The Global Oil Market")
    @third_preview = Preview.find_by(title: "Emerging Markets Debt")
  end
end

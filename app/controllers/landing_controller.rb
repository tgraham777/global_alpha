class LandingController < ApplicationController
  def show
  end

  def index
    @first_preview = Preview.find_by(title: "The Global Oil Market")
    @second_preview = Preview.find_by(title: "Foreign Holdings of U.S. Debt")
    @third_preview = Preview.find_by(title: "Emerging Markets Debt")
  end
end

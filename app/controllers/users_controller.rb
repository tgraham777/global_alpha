class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find_by(display_name: params[:display_name])
  end

  def edit
    @user = User.find_by(display_name: params[:display_name])
  end

  def update
    @user = User.find_by(display_name: params[:display_name])
    if @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      flash[:success] = "Password was updated successfully."
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.first
      redirect_to edit_user_path(@user)
    end
  end
end

class Admin::UsersController < Admin::BaseController
  def new
    @user = User.new
  end

  def create
    params[:username].downcase!
    @user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation], role: params[:role])
    if @user.save
      flash[:success] = "New user #{@user.username} created with role of #{@user.role}"
      redirect_to login_path
    else
      flash[:error] = @user.errors.full_messages.first
      render :action => 'new'
    end
  end

  def show
    if current_user
      user_name = params[:username].split("-").join(" ")
      @user = User.find_by(username: user_name)
    else
      flash[:error] = "You need to log in or create an account first!"
      redirect_to login_path
    end
  end
end

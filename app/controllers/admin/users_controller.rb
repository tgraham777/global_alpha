class Admin::UsersController < Admin::BaseController
  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation], role: params[:role])
    if @user.save
      @user.update(display_name: SecureRandom.hex(5))
      name = @user.username
      role = @user.role.capitalize
      flash[:success] = "New user #{name} created with role of #{role}"
      redirect_to new_admin_user_path
    else
      flash[:error] = @user.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    if current_user
      @user = User.find_by(display_name: params[:display_name])
    else
      flash[:error] = "You need to log in or create an account first!"
      redirect_to login_path
    end
  end

  def edit
    @user = User.find_by(display_name: params[:display_name])
  end

  def update
    @user = User.find_by(display_name: params[:display_name])
    if @user.update(password: params[:password], password_confirmation: params[:password_confirmation], role: params[:role])
      flash[:success] = "User #{@user.username} was updated successfully."
      redirect_to admin_user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.first
      redirect_to edit_admin_user_path(@user)
    end
  end

  def destroy
    user = User.find_by(display_name: params[:display_name])
    user.destroy
    flash[:success] = "User deleted!"
    redirect_to admin_users_path
  end
end

class Admin::UsersController < Admin::AdminController
  before_action :logged_admin
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:login, :password, :active, :admin)
    end

    def logged_admin
      if !admin_logged_in?
        redirect_to current_user
      end
    end
end

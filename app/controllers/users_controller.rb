class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :get_user_articles, only: [:show]

  def show
    if current_user.id != @user.id
      redirect_to current_user
    end
  end

  def new
    @user = User.new
  end

  def edit
    if @user.id != current_user.id
      redirect_to edit_user_path(current_user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:login, :password, :avatar, :active, :admin)
    end

    def get_user_articles
      @articles = Article.where(user_id: current_user.id)
    end
end

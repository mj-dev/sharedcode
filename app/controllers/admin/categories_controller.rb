class Admin::CategoriesController < Admin::AdminController
  before_action :logged_admin
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.includes(:image)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_url
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_url
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :image_id)
    end

    def logged_admin
      if !admin_logged_in?
        redirect_to current_user
      end
    end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :set_articles, only: [:show]
  before_action :set_image, only: [:show]

  def index
    @categories = Category.includes(:image)
  end

  def show
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :image_id)
    end

    def set_articles
      @articles = Article.where(category_id: params[:id])
    end

    def set_image
      @image = Image.find(@category.image_id)
    end
end

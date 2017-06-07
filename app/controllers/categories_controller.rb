class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

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
end

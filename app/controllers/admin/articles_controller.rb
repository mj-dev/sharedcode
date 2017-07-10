class Admin::ArticlesController < Admin::AdminController
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.includes(:image, :user, :category)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_url
    else
      render 'admin/articles/new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_url
    else
      render 'admin/articles/edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_url
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:name, :content, :image_id, :user_id, :category_id)
    end
end

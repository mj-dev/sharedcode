class ArticlesController < PublicController
  before_action :set_article, only: [:show]
  before_action :set_user, only: [:show]
  before_action :set_image, only: [:show]
  before_action :set_category, only: [:show]

  def index
    @articles = Article.includes(:image, :user, :category)
  end

  def show
    @commentaries = Commentary.where(article_id: params[:id])
    @commentary = Commentary.new
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def set_user
      article = set_article
      @user = User.find(article.user_id)
    end

  def set_image
    article = set_article
    @image = Image.find(article.image_id)
  end

  def set_category
    article = set_article
    @category = Category.find(article.category_id)
  end
end

class ArticlesController < PublicController
  before_action :is_logged, only: [:edit, :new]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show]
  before_action :set_image, only: [:show]
  before_action :set_category, only: [:show]

  def index
    @articles = Article.includes(:image, :user, :category)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def show
    @commentaries = Commentary.where(article_id: params[:id])
    @commentary = Commentary.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to current_user
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

  def article_params
    params.require(:article).permit(:name, :content, :image_id, :user_id, :category_id)
  end

  def is_logged
    if !logged_in?
      redirect_to login_path
    end
  end
end

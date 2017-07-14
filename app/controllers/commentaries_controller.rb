class CommentariesController < ApplicationController
  before_action :is_logged , only: [:edit, :new, :destroy]
  before_action :set_commentary, only: [:edit, :update, :destroy]
  before_action :set_article, only: [:index]

  def index
    @commentaries = Commentary.includes(:mail, :content, :article_id)
  end

  def new
    @commentary = Commentary.new
  end

  def create
    @commentary = Commentary.new(commentary_params)
    if @commentary.save
      redirect_to :back
    else
      render :new
    end
  end

  private
    def set_commentary
      @commentary = Commentary.find(params[:id])
    end

    def commentary_params
      params.require(:commentary).permit(:mail, :content, :article_id)
    end

  def set_article
    @article = Article.find(params[:article_id ])
  end

  def is_logged
    if !logged_in?
      redirect_to login_path
    end
  end

end

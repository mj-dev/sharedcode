class CommentariesController < ApplicationController
  before_action :set_commentary, only: [:show, :edit, :update, :destroy]

  def index
    @commentaries = Commentary.all
  end

  def show
  end

  def new
    @commentary = Commentary.new
  end

  def edit
  end

  def create
    @commentary = Commentary.new(commentary_params)
    if @commentary.save
      redirect_to @commentary
    else
      render :new
    end
  end

  def update
    if @commentary.update(commentary_params)
      redirect_to @commentary
    else
      render :edit
    end
  end

  def destroy
    @commentary.destroy
    redirect_to commentaries_url
  end

  private
    def set_commentary
      @commentary = Commentary.find(params[:id])
    end

    def commentary_params
      params.require(:commentary).permit(:mail, :content, :article_id)
    end
end

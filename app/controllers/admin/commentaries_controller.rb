class Admin::CommentariesController < Admin::AdminController
  before_action :set_commentary, only: [:edit, :update, :destroy]

  def index
    unless logged_in?
      redirect_to login_url
    end
    @commentaries = Commentary.all
  end

  def edit
  end

  def update
    if @commentary.update(commentary_params)
      redirect_to admin_commentaries_path
    else
      render :edit
    end
  end

  def destroy
    @commentary.destroy
    redirect_to admin_commentaries_url
  end

  private
    def set_commentary
      @commentary = Commentary.find(params[:id])
    end

    def commentary_params
      params.require(:commentary).permit(:mail, :content, :article_id)
    end
end

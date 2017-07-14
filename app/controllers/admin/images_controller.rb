class Admin::ImagesController < Admin::AdminController
  before_action :logged_admin
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  def update
    if @image.update(image_params)
      redirect_to @image
    else
      render :edit
    end
  end

  def destroy
    @image.destroy
    redirect_to admin_images_url
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:path, :alt)
    end

    def logged_admin
      if current_user.admin != true
        redirect_to current_user
      end
    end
end

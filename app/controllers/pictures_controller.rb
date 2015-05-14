class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @pictures = Picture.all
    respond_with(@pictures)
  end

  def show
    respond_with(@picture)
  end

  def new
    @picture = Picture.new
    respond_with(@picture)
  end

  def edit
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      flash[:success] = "Picture Created!"
    end

    # @picture = Picture.new(picture_params)
    # @picture.save
    respond_with(@picture)
  end

  def update
    @picture.update(picture_params)
    respond_with(@picture)
  end

  def destroy
    @picture.destroy
    respond_with(@picture)
  end

  private

    def correct_user
      @picture = current_user.pictures.find_by_id(params[:id])
      redirect_to root_url if @picture.nil?
      flash[:alert] = "That's not your picture!"
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:name, :photosphere)
    end
end

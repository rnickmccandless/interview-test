class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :find_photo, only: [:edit, :update, :destroy]

  def create
    @photo = Photo.new photo_params

    set_flash_and_redirect { @photo.save }
  end

  def edit
  end

  def update
    set_flash_and_redirect { @photo.update(photo_params) }
  end

  def destroy
    set_flash_and_redirect { @photo.destroy }
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption, :user_id)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def set_flash_and_redirect
    if yield
      flash[:success] = 'Successful'
    else
      flash[:error] = @photo.errors.full_messages
    end

    redirect_to :gallery
  end
end

class GalleryController < ApplicationController
  def show
    @photos = Photo.all
    @photo = Photo.new
  end

  def create
    @photo = Photo.new photo_params

    if @photo.save
      flash[:success] = 'Successfully saved'
    else
      flash[:error] = @photo.errors.full_messages.join("\n")

      puts @photo.errors.full_messages.join("\n")
    end

    redirect_to :gallery
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      flash[:success] = 'Successfully saved'
    else
      flash[:error] = @photo.errors.full_messages.join("\n")
    end

    redirect_to :gallery
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption, :user_id)
  end
end

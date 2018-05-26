class GalleryController < ApplicationController
  def show
    @photos = Photo.all
    @photo = Photo.new
  end
end

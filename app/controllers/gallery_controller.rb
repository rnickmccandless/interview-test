class GalleryController < ApplicationController
  def show
    @photos = Photo.all
    @photo = Photo.new
    @comment = Comment.new
  end
end

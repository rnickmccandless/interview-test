class GalleryController < ApplicationController
  def show
    @photos = Photo.with_comments
    @photo = Photo.new
    @comment = Comment.new
  end
end

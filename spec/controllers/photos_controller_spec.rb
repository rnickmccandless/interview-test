require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  describe "GET #create" do
    it "returns http success" do
      photo_params = attributes_for :photo
      photo_params[:user_id] = create(:user).id

      expect { post :create, params: { photo: photo_params } }.to change(Photo, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      photo = create :photo

      get :edit, params: { id: photo.id }

      expect(response).to have_http_status(:success)
    end
  end
end

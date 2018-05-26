require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  context 'public user' do
    describe "POST #create" do
      it "adds one to count" do
        photo_params = attributes_for :photo
        photo_params[:user_id] = create(:user).id

        expect { post :create, params: { photo: photo_params } }.to change(Photo, :count).by(0)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        photo = create :photo

        get :edit, params: { id: photo.id }

        expect(response).to have_http_status(:redirect)
      end
    end

    describe "PATCH #update" do
      it "successfully updates" do
        photo = create :photo

        patch :update, params: { id: photo.id, photo: { caption: 'This is changed' } }

        expect(Photo.find(photo.id).caption).not_to eq('This is changed')
      end
    end

    describe "DELETE #destroy" do
      it "successfully destroys" do
        photo = create :photo

        expect { delete :destroy, params: { id: photo.id } }.to change(Photo, :count).by(0)
      end
    end
  end

  context 'signed in' do
    let(:user) { create :user }

    describe "POST #create" do
      it "adds one to count" do
        sign_in user

        photo_params = attributes_for :photo
        photo_params[:user_id] = create(:user).id

        expect { post :create, params: { photo: photo_params } }.to change(Photo, :count).by(1)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        sign_in user

        photo = create :photo

        get :edit, params: { id: photo.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe "PATCH #update" do
      it "successfully updates" do
        sign_in user

        photo = create :photo

        patch :update, params: { id: photo.id, photo: { caption: 'This is changed' } }

        expect(Photo.find(photo.id).caption).to eq('This is changed')
      end
    end

    describe "DELETE #destroy" do
      it "successfully destroys" do
        sign_in user

        photo = create :photo

        expect { delete :destroy, params: { id: photo.id } }.to change(Photo, :count).by(-1)
      end
    end
  end
end

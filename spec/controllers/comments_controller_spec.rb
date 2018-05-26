require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:photo) { create :photo }

  context 'public user' do
    describe "POST #create" do
      it "adds one to count" do
        comment_params = attributes_for :comment
        comment_params[:user_id] = create(:user).id
        comment_params[:photo_id] = photo.id

        expect { post :create, params: { photo_id: photo.id, comment: comment_params }, xhr: true }.to change(Comment, :count).by(0)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        comment = create :comment

        get :edit, params: { id: comment.id, photo_id: photo.id }

        expect(response).to have_http_status(:redirect)
      end
    end

    describe "PATCH #update" do
      it "successfully updates" do
        comment = create :comment

        patch :update, params: { id: comment.id, photo_id: photo.id, comment: { comment: 'This is changed' } }

        expect(Comment.find(comment.id).comment).not_to eq('This is changed')
      end
    end

    describe "DELETE #destroy" do
      it "successfully destroys" do
        comment = create :comment

        expect { delete :destroy, params: { id: comment.id, photo_id: photo.id } }.to change(Comment, :count).by(0)
      end
    end
  end

  context 'signed in' do
    let(:user) { create :user }

    describe "POST #create" do
      it "adds one to count" do
        sign_in user

        comment_params = attributes_for :comment
        comment_params[:user_id] = create(:user).id
        comment_params[:photo_id] = photo.id

        expect { post :create, params: { photo_id: photo.id, comment: comment_params }, xhr: true }.to change(Comment, :count).by(1)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        sign_in user

        comment = create :comment

        get :edit, params: { id: comment.id, photo_id: photo.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe "PATCH #update" do
      it "successfully updates" do
        sign_in user

        comment = create :comment

        patch :update, params: { id: comment.id, photo_id: photo.id, comment: { comment: 'This is changed' } }

        expect(Comment.find(comment.id).comment).to eq('This is changed')
      end
    end

    describe "DELETE #destroy" do
      it "successfully destroys" do
        sign_in user

        comment = create :comment

        expect { delete :destroy, params: { id: comment.id, photo_id: photo.id } }.to change(Comment, :count).by(-1)
      end
    end
  end
end

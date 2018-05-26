# frozen_string_literal: true

Rails.application.routes.draw do
  resource :gallery, controller: :gallery, only: :show do
    resources :photos, only: [:edit, :create, :update, :destroy]
  end

  devise_for :users

  root 'home#index'
end

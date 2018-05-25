# frozen_string_literal: true

Rails.application.routes.draw do
  resource :gallery, controller: :gallery

  devise_for :users

  root 'home#index'
end

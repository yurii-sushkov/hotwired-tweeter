# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :mentions, only: :index
  resources :tweets do
    resource :like
    resources :comments
  end
  resources :users, only: %i[show] do
    resource :subscription
  end
  resources :notifications, only: %i[index] do
    collection do
      post :mark_as_read
    end
  end
  root 'tweets#index'
end

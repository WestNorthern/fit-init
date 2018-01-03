Rails.application.routes.draw do

  get 'about/show'

  resources :workouts

  resources :about, only: [:show, :index]

  resources :hourly_scores

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post "/check_username", to: "users/registrations#check_username"
    post "/check_email", to: "users/registrations#check_email"
  end

	resources :users, only: [:index, :show, :edit, :update]

	root "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

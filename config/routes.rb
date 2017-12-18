Rails.application.routes.draw do

  get 'workouts/show'

  get 'workouts/new'

  get 'workouts/create'

  get 'workouts/edit'

  get 'workouts/update'

  get 'workouts/destroy'

  get 'workouts/index'

  get 'hourly_scores/index'

  get 'hourly_scores/new'

  get 'hourly_scores/create'

  get 'hourly_scores/edit'

  get 'hourly_scores/update'

  get 'hourly_scores/destroy'

  get 'hourly_scores/show'

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

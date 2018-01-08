yarn check v1.3.2
success Folder in sync.
Done in 0.18s.
                  Prefix Verb   URI Pattern                       Controller#Action
                  badges GET    /badges(.:format)                 badges#index
                         POST   /badges(.:format)                 badges#create
               new_badge GET    /badges/new(.:format)             badges#new
              edit_badge GET    /badges/:id/edit(.:format)        badges#edit
                   badge GET    /badges/:id(.:format)             badges#show
                         PATCH  /badges/:id(.:format)             badges#update
                         PUT    /badges/:id(.:format)             badges#update
                         DELETE /badges/:id(.:format)             badges#destroy
              about_show GET    /about/show(.:format)             about#show
          users_progress GET    /users/progress(.:format)         users#progress
                workouts GET    /workouts(.:format)               workouts#index
                         POST   /workouts(.:format)               workouts#create
             new_workout GET    /workouts/new(.:format)           workouts#new
            edit_workout GET    /workouts/:id/edit(.:format)      workouts#edit
                 workout GET    /workouts/:id(.:format)           workouts#show
                         PATCH  /workouts/:id(.:format)           workouts#update
                         PUT    /workouts/:id(.:format)           workouts#update
                         DELETE /workouts/:id(.:format)           workouts#destroy
             about_index GET    /about(.:format)                  about#index
                   about GET    /about/:id(.:format)              about#show
           hourly_scores GET    /hourly_scores(.:format)          hourly_scores#index
                         POST   /hourly_scores(.:format)          hourly_scores#create
        new_hourly_score GET    /hourly_scores/new(.:format)      hourly_scores#new
       edit_hourly_score GET    /hourly_scores/:id/edit(.:format) hourly_scores#edit
            hourly_score GET    /hourly_scores/:id(.:format)      hourly_scores#show
                         PATCH  /hourly_scores/:id(.:format)      hourly_scores#update
                         PUT    /hourly_scores/:id(.:format)      hourly_scores#update
                         DELETE /hourly_scores/:id(.:format)      hourly_scores#destroy
        new_user_session GET    /users/sign_in(.:format)          users/sessions#new
            user_session POST   /users/sign_in(.:format)          users/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)         users/sessions#destroy
       new_user_password GET    /users/password/new(.:format)     devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
           user_password PATCH  /users/password(.:format)         devise/passwords#update
                         PUT    /users/password(.:format)         devise/passwords#update
                         POST   /users/password(.:format)         devise/passwords#create
cancel_user_registration GET    /users/cancel(.:format)           users/registrations#cancel
   new_user_registration GET    /users/sign_up(.:format)          users/registrations#new
  edit_user_registration GET    /users/edit(.:format)             users/registrations#edit
       user_registration PATCH  /users(.:format)                  users/registrations#update
                         PUT    /users(.:format)                  users/registrations#update
                         DELETE /users(.:format)                  users/registrations#destroy
                         POST   /users(.:format)                  users/registrations#create
          check_username POST   /check_username(.:format)         users/registrations#check_username
             check_email POST   /check_email(.:format)            users/registrations#check_email
                   users GET    /users(.:format)                  users#index
               edit_user GET    /users/:id/edit(.:format)         users#edit
                    user GET    /users/:id(.:format)              users#show
                         PATCH  /users/:id(.:format)              users#update
                         PUT    /users/:id(.:format)              users#update
                    root GET    /                                 home#index

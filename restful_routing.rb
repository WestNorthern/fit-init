yarn check v1.3.2
success Folder in sync.
Done in 0.16s.
                  Prefix Verb   URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       users/sessions#new
            user_session POST   /users/sign_in(.:format)       users/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      users/sessions#destroy
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
           user_password PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
                         POST   /users/password(.:format)      devise/passwords#create
cancel_user_registration GET    /users/cancel(.:format)        users/registrations#cancel
   new_user_registration GET    /users/sign_up(.:format)       users/registrations#new
  edit_user_registration GET    /users/edit(.:format)          users/registrations#edit
       user_registration PATCH  /users(.:format)               users/registrations#update
                         PUT    /users(.:format)               users/registrations#update
                         DELETE /users(.:format)               users/registrations#destroy
                         POST   /users(.:format)               users/registrations#create
          check_username POST   /check_username(.:format)      users/registrations#check_username
             check_email POST   /check_email(.:format)         users/registrations#check_email
                   users GET    /users(.:format)               users#index
               edit_user GET    /users/:id/edit(.:format)      users#edit
                    user GET    /users/:id(.:format)           users#show
                         PATCH  /users/:id(.:format)           users#update
                         PUT    /users/:id(.:format)           users#update
                    root GET    /                              home#index

Rails.application.routes.draw do
  devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
    delete '/users' => 'devise/registrations#destroy', as: :destroy_user_registration
  end
  resources :tasks
  root "tasks#index"
end

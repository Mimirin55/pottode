Rails.application.routes.draw do
  resources :tasks
  root 'tasks#index'
  devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
    delete '/users' => 'devise/registrations#destroy', as: :destroy_user_registration
  end
end

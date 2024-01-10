Rails.application.routes.draw do
  resources :tasks
  root 'tasks#index'
  devise_for :users
  devise_scope :users do
    delete '/users' => 'devise/registrations#destroy', as: :destroy_user_registration
  end
end

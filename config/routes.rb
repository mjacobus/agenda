Agenda::Application.routes.draw do

  get "pages/home"
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :tasks

  root to: 'pages#home'
  put '/test' => 'users#test_action'
end

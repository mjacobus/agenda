Agenda::Application.routes.draw do
  devise_for :users
  resources :tasks

  root to: 'tasks#index'
  put '/test' => 'users#test_action'
end

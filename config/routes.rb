Agenda::Application.routes.draw do
  devise_for :users
  resources :tasks

  put '/test' => 'users#test_action'
end

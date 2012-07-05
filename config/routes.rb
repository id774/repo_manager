RailsApp::Application.routes.draw do
  root :to => 'repos#index'
  resources :repos,
    :only => [:index, :new, :create]
  resources :gits,
    :only => [:show, :destroy]
  resources :svns,
    :only => [:show, :destroy]
  #devise_for :users
  match '*path', :to => 'application#error_404'
end

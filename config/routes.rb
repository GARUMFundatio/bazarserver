Bazarserver::Application.routes.draw do
  
  devise_for :users, :path => "usuarios", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  resources :clusters
  resources :gruposconfs
  resources :confs
  resources :noticias
  
  root :to => 'home#index'

  match 'micuenta' => "user#edit",          :as => :micuenta
  match 'login' => "devise/sessions#new",      :as => :login
  match 'logout' => "devise/sessions#destroy", :as => :logout
  match 'home' => "home#index"
  match '/clusters/activar/:id' => 'clusters#activar', :constrants => { :id => /\d+/ }, :as => :activar_cluster

end

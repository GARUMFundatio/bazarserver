Bazarserver::Application.routes.draw do
  
  resources :estadisticasbazares

  root :to => 'home#index'
  match '/noticias.rss' => 'noticias#rss'
  
  devise_for :users, :path => "usuarios", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'altausuario' }
  resources :clusters
  resources :gruposconfs
  resources :confs
  resources :noticias
  
  

  match 'micuenta' => "user#edit",          :as => :micuenta
  match 'login' => "devise/sessions#new",      :as => :login
  match 'logout' => "devise/sessions#destroy", :as => :logout
  match 'home' => "home#index"
  match '/clusters/activar/:id' => 'clusters#activar', :constrants => { :id => /\d+/ }, :as => :activar_cluster
  match '/clusters/show2/:id' => 'clusters#show2', :constrants => { :id => /\d+/ }

end

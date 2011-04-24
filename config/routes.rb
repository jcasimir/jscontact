JSContact::Application.routes.draw do
  resources :companies, :email_addresses, :phone_numbers, :people  
  match '/auth/:provider/callback', :to => 'sessions#create'
  match "/login" => redirect("/auth/twitter"), :as => :login
  match "/logout" => "sessions#destroy", :as => :logout
  root :to => "companies#index"
end

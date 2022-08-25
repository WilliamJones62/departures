Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :departures
    end
  end
  resources :departures
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "departures#index"
end

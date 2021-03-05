Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #flights
  resources :flights, only: [:index, :show]

  #passenger_flights
  resources :passenger_flights, only: [:destroy]
end

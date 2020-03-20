Rails.application.routes.draw do

  resources :weathers, only: %i(show)

end

Rails.application.routes.draw do
  get '/ferrets', to: "ferrets#index"
  get '/ferrets/:id', to: "ferrets#show"
  get '/ferrets/:ferret_id/snacks', to: "ferret_snacks#index"

  get '/snacks', to: "snacks#index"
  get '/snacks/:id', to: "snacks#show"
end

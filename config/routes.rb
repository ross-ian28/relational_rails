Rails.application.routes.draw do
  get '/ferrets', to: "ferrets#index"
  get '/ferrets/new', to: "ferrets#new"
  get '/ferrets/:id', to: "ferrets#show"
  post '/ferrets', to: "ferrets#create"
  get '/ferrets/:ferret_id/snacks', to: "ferret_snacks#index"

  get '/snacks', to: "snacks#index"
  get '/snacks/:id', to: "snacks#show"
end

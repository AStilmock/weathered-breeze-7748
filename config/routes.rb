Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/scientists/:id", to: "scientists#show"

  get "/experiments", to: "experiments#index"

  delete "/scientists/:id/hypotheses", to: "hypotheses#destroy"
end

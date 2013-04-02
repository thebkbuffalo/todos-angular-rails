TodosAngularRails::Application.routes.draw do
  resources :todos


  get "welcome/index"
  root to: "welcome", action: "index"

end

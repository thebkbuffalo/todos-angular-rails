TodosAngularRails::Application.routes.draw do
  get "welcome/index"
  root to: "welcome", action: "index"

end

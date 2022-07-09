Rails.application.routes.draw do
  get '/parks', to: 'parks#index' #accepting request and routing to parks controller with index action
  get '/parks/:id', to: 'parks#show' #id of parks sending request to parks controller and show action (to render specific html)
end

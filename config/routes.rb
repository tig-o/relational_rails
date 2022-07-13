Rails.application.routes.draw do
  get '/parks', to: 'parks#index' #accepting request and routing to parks controller with index action
  get '/parks/:id', to: 'parks#show' #id of parks sending request to parks controller and show action (to render specific html)
  get '/trails', to: 'trails#index' #can now accept trails page request, action index
  get '/trails/:id', to: 'trails#show' #id of trails sending request to trails controller and show action (to render specific html)
  get '/parks/:park_id/trails', to: 'park_trails#index'
end

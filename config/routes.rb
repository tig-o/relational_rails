Rails.application.routes.draw do
  get '/parks', to: 'parks#index' #accepting request and routing to parks controller with index action
end

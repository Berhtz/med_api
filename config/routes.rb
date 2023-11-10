Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  get '/make_api_request', to: 'api#make_api_request'
  post '/consultation_requests', to:'consultation_request#create'
  post '/consultation_requests/:request_id/recommendations', to:'recommendation#create'
  get '/patients/:patient_id/recommendations', to:'recommendation#get_recommendations'

end

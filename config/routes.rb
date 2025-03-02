Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
   
  # API v1
  namespace :api do
    namespace :v1 do
      resources :students, only: [:create, :destroy]
      get 'schools/:school_id/classes/:class_id/students', to: 'students#by_school'

      resources :schools, only: [] do
        resources :classes, only: [:index], controller: 'classrooms'
      end

      match '*unmatched_route', to: 'application#route_not_found', via: :all
    end
  end
end
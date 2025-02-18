Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             path: "v1/",
             path_names: {
              sign_in: "users/log_in",
              sign_out: "users/log_out",
              registration: "users/sign_up",
              confirmation: "users/confirmation",
              password: "users/password"
             },
             controllers: {
              sessions: "users_auth/sessions",
              registrations: "users_auth/registrations",
              confirmations: "users_auth/confirmations",
              passwords: "users_auth/passwords"
             }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :v1 do
    resources :podcasts

    resources :articles do
      resources :sections, shallow: true
    end

    resources :news
    resources :tips

    get "products/featured" => "products#featured"
    resources :products

    resources :subscribers, except: %i[show update]
    resources :contact_submissions, except: %i[show update]
  end
end

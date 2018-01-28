Rails.application.routes.draw do
  root 'interventions#new'
  resources :interventions, only: %i[new create deletion]

  get 'calendars/availabilities' => 'calendars#availabilities'

  namespace :admin do
    root 'calendars#index'
    resources :calendars do
      resources :openings
    end
    resources :appointments
    resources :interventions
  end
end

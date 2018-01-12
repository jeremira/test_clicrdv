Rails.application.routes.draw do
  root 'calendars#index'
  resources :calendars
  resources :appointments
  resources :interventions
end

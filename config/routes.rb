Rails.application.routes.draw do
  resources :calendars
  resources :appointments
  resources :interventions
end

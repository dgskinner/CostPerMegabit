Rails.application.routes.draw do
  root to: 'application#root'
  
  resources :schools, only: :index, defaults: {format: :json}
end

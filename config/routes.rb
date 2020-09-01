Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: "custom_devise/sessions",
      registrations: "custom_devise/registrations"
  }

  resources :videos, only: [:index, :show]

  root to: "videos#index"
end

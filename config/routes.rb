Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "custom_devise/sessions" }

  root to: "home#index"
end

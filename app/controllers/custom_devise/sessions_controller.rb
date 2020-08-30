class CustomDevise::SessionsController < Devise::SessionsController
  include TokenManager

  after_action :authenticate_provider_user
end

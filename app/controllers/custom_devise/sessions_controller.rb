class CustomDevise::SessionsController < Devise::SessionsController
  include TokensManager

  after_action :authenticate_provider_user
end

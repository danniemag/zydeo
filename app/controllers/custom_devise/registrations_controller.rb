class CustomDevise::RegistrationsController < Devise::RegistrationsController
  include TokensManager

  after_action :authenticate_provider_user
end

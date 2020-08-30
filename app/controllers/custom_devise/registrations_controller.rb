class CustomDevise::RegistrationsController < Devise::RegistrationsController
  include TokenManager

  after_action :authenticate_provider_user
end

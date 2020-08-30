class CustomDevise::RegistrationsController < Devise::RegistrationsController
  include DeviseManager

  after_action :authenticate_zype_user
end

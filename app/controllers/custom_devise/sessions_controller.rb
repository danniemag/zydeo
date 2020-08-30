class CustomDevise::SessionsController < Devise::SessionsController
  include DeviseManager

  after_action :authenticate_zype_user
end

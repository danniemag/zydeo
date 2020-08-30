class CustomDevise::SessionsController < Devise::SessionsController
  include DeviseManager

  after_action :authenticate_zype_user

  def new
    super
  end

  def create
    super
  end
end

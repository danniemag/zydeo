class CustomDevise::SessionsController < Devise::SessionsController
  after_action :authenticate_zype_user

  def new
    super
  end

  def create
    super
  end

  private

  def authenticate_zype_user
    return unless current_user
    begin
      if current_user.token_expires_at.nil? || current_user.token_expires_at <= Time.now
        client = OAuth2::Client.new(Rails.application.credentials[:client_id],
                                    Rails.application.credentials[:client_secret],
                                    site: Rails.application.credentials[:provider_site],
                                    token_url: Rails.application.credentials[:provider_token_url])
        token = client.password.get_token(params[:user][:password], params[:user][:password])
      end
    rescue OAuth2::Error => e
      current_user.update_attributes(token_expires_at: nil)
    end
  end
end

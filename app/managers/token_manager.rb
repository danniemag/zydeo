require 'active_support/concern'

module TokenManager
  extend ActiveSupport::Concern

  def authenticate_provider_user
    return unless current_user

    begin
      @client = set_oauth_client

      if current_user.token_expires_at.nil?
        response = get_token
      elsif current_user.token_expires_at <= Time.now
        response = JSON.parse(refresh_token.body)
      end
      set_token_params(response) if response
    rescue OAuth2::Error => e
      current_user.update_attributes(access_token: nil, refresh_token: nil, token_expires_at: nil)
    end
  end

  def set_oauth_client
    OAuth2::Client.new(Rails.application.credentials[:client_id],
                       Rails.application.credentials[:client_secret],
                       site: Rails.application.credentials[:provider_site],
                       token_url: Rails.application.credentials[:provider_token_url])
  end

  def set_token_params(response)
    if response.is_a? Hash
      token_params = {
          access_token: response['access_token'],
          refresh_token: response['refresh_token'],
          token_expires_at: Time.now + response['expires_in']
      }
    else
      token_params = {
          access_token: response.token,
          refresh_token: response.refresh_token,
          token_expires_at: Time.at(response.expires_at)
      }
    end
    set_token_data(token_params)
  end

  def set_token_data(token_params)
    current_user.update_attributes(token_params)
  end

  def get_token
    @client.password.get_token(params[:user][:email], params[:user][:password])
  end

  def refresh_token
    @client.request(:post,
                    'https://login.zype.com/oauth/token',
                    { params: { grant_type: 'refresh_token', refresh_token: current_user.refresh_token }}
    )
  end
end

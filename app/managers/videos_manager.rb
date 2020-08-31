require 'active_support/concern'

module VideosManager
  extend ActiveSupport::Concern

  def fetch_videos
    videos = @client.request(:get,
                    'https://api.zype.com/videos',
                    { params: { app_key: Rails.application.credentials[:app_key] } }
    )
    videos.body
  end
end

class VideosController < ApplicationController
  include VideosManager

  skip_before_action :authenticate_user!, only: :index
  before_action :set_client, only: :index

  def index
    @videos = JSON.parse(fetch_videos)
  end

  private

  def set_client
    @client = set_oauth_client
  end
end

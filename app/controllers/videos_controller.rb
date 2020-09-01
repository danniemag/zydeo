class VideosController < ApplicationController
  include VideosManager

  skip_before_action :authenticate_user!
  before_action :set_client

  def index
    @videos = JSON.parse(fetch_videos)
  end

  def show
    video = JSON.parse(get_video(params[:id]))
    @video = video['response']
  end

  private

  def set_client
    @client = set_oauth_client
  end
end

module VideosHelper
  def subscription_required(video)
    video['subscription_required']
  end

  def video_is_playable(video)
    current_user&.access_token || !subscription_required(video)
  end

  def displayable_video_class(video)
    video_is_playable(video) ? 'embed-responsive-16by9' : 'non_displayable_video'
  end
end

require 'active_support/concern'

module UserSearch
  extend ActiveSupport::Concern

  def is_customer
    self.token_expires_at.present? && self.token_expires_at >= Time.now
  end
end

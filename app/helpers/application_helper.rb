module ApplicationHelper
  def slider_not_displayable
    self.controller.class.parent == CustomDevise || current_user
  end

  def content_is_displayable
    self.controller.class.parent != CustomDevise
  end
end

module ApplicationHelper
  def slider_not_displayable
    self.controller.class.parent == CustomDevise || current_user || self.action_name == 'show'
  end

  def content_is_displayable
    self.controller.class.parent != CustomDevise && self.action_name != 'show'
  end
end

class FriendshipDecorator < Draper::Decorator
  delegate_all

  def user_view
    (h.current_user == object.user) ? object.friend : object.user
  end
  def status_or_buttons
    return buttons if object.pending? && object.user != h.current_user
    return status
  end

  def status
    return "Aceptada" if object.active?
    return "Denegada" if object.denied?
    return "Esperando respuesta" if object.pending?
  end
  def buttons
    (confirm_button + denegate_button).html_safe
  end

  def confirm_button
    h.link_to "Aceptar", h.friendship_path(object, status: 1), method: :patch, class:"right-space mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
  end

  def denegate_button
    h.link_to "Denegar", h.friendship_path(object, status: 0), method: :patch, class:"right-space mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
  end
end

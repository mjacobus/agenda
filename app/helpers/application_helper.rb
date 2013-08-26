module ApplicationHelper

  def facebook_login_button(size = :big)
    title = t('system.helpers.links.facebook_login')
    login = t('system.helpers.links.login')

    link_to(user_omniauth_authorize_path(:facebook)) do
      content_tag(:div, title, class: "login facebook #{size} face", title: title) + content_tag(:div, login, class: 'login-text')
    end
  end

end

module ApplicationHelper
  def facebook_login_button(size = :big)
    title = t('system.helpers.links.facebook_login')

    link_to(user_omniauth_authorize_path(:facebook)) do
      content_tag(:div, title, class: "login facebook #{size}", title: title)
    end

  end
end

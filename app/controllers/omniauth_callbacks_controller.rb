class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    env          = request.env["omniauth.auth"]
    origin       = request.env["omniauth.origin"]
    user         = OauthFacebook.find_or_build_user(env)
    redirect_url = redirect_url_for(user, origin)
    message      = login_message(user)
    user.save!(validate: false)
    sign_in(user, event: :authentication)
    redirect_to redirect_url, notice: message, only_path: true
  end

  def login_message(user)
    key = user.new_record? ? 'welcome' : 'login_succeed'
    I18n.t("system.messages.#{key}")
  end

  def redirect_url_for(user, origin)
    tasks_path
  end
end


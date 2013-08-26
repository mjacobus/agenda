class OauthFacebook
  def self.find_or_build_user(params)
    user = User.where(uid: params[:uid], provider: :facebook).first

    unless user
      user = User.new
      user.uid = params[:uid]
      user.provider = 'facebook'
    end

    user.email = params[:info][:email]
    user.name = params[:info][:name]
    user.avatar = params[:info][:image]
    user
  end
end
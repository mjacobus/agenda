require 'spec_helper'

describe OmniauthCallbacksController do

  describe "#facebook" do
    let(:params) { OauthHelper.providers[:facebook] }
    let(:user) { build(:user) }

    before do
      OauthFacebook.should_receive(:find_or_build_user).with(params).and_return(user)
      stub_omniauth_with(params)
      controller.stub(:redirect_url_for).with(user, root_url).and_return(root_url)
    end

    it "saves user" do
      user.should_receive(:save!).with(validate: false)
      get :facebook
    end

    it "logs user in" do
      get :facebook
      expect(controller.current_user).to eq(User.last)
    end

    it "redirects to the 'redirect_url'" do
      get :facebook
      expect(response).to redirect_to(root_url)
    end

    it "presents 'login_message'" do
      get :facebook
      expect(flash[:notice]).to eq(I18n.t('system.messages.welcome'))
    end
  end

  describe "#redirect_url_for" do

  end

  def stub_omniauth_with(params)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["omniauth.auth"] = params
    @request.env["omniauth.origin"] = root_url
  end
end

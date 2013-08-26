require 'spec_helper'
require 'oauth_facebook'

describe OauthFacebook do
  let(:params) { OauthHelper.providers[:facebook] }
  let(:existing_user) do
    user = OauthFacebook.find_or_build_user(params)
    user.save!
    user
  end

  describe ".find_or_build_user" do

    context "when user does not exist" do
      it "builds a new user" do
        user = OauthFacebook.find_or_build_user(params)
        expect(user).to be_a(User)
        expect(user).not_to be_persisted
        expect(user).to be_new_record
      end

      it "assigns correct data to users" do
        user = OauthFacebook.find_or_build_user(params)
        expect(user.uid).to eq(params[:uid])
        expect(user.provider).to eq('facebook')
        expect(user.email).to eq(params[:info][:email])
        expect(user.name).to eq(params[:info][:name])
        expect(user.avatar).to eq(params[:info][:image])
      end
    end

    context "when user does exist" do
      it "does not create an user" do
        existing_user
        user = OauthFacebook.find_or_build_user(params)
        expect(user.id).to eq(existing_user.id)
        expect(user).not_to be_new_record
      end

      it "updates data when user changes it" do
        existing_user.email = 'another@email.com'
        existing_user.name = 'another name'
        existing_user.save(validate: false)
        user = OauthFacebook.find_or_build_user(params)
        expect(user.email).to eq(params[:info][:email])
        expect(user.name).to eq(params[:info][:name])
        expect(user.avatar).to eq(params[:info][:image])
      end
    end

  end
end
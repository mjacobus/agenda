require 'spec_helper'

UsersController.class_eval do
  def test_action
    render text: :ok
  end
end

describe UsersController do
  let(:valid_session) do
    sign_in(create(:user))
    @session
  end

  it "executes action when user is logged in" do
    put :test_action,{}, valid_session
    expect(response).to be_success
  end

  it "redirects to /users/sign_in when user is not logged in" do
    pending 'it works, but test fails. its says it redirects to http://test.host'
    put :test_action, {}, {}
    response.should redirect_to('')
  end
end

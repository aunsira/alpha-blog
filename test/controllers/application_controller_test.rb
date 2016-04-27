require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase

  def setup
    @user = User.create(username: 'test', email: 'test@mail.com', password: 'pingu123')
  end

  test "check current user" do
    session[:user_id] = @user.id
    assert_equal @user, @controller.send(:current_user)
  end

  test "check logged in user" do
    session[:user_id] = @user.id
    assert_equal true, @controller.send(:logged_in?)
  end

  test "check required user" do
    session[:user_id] = @user.id
    assert_equal nil, @controller.send(:required_user)
    @controller.send(:required_user)
    assert_response :success
  end
end
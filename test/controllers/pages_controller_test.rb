require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  def setup
    @user = User.create(username: "test", email: "test@mail.com", password: "pingu123", admin: false)
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get list articles page if user logged in" do
    session[:user_id] = @user.id
    get :home
    assert_redirected_to articles_path
  end
end
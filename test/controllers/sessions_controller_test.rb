require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    @user = User.create(username: "aun", email: "aun@mail.com", password: "pingu123", admin: true)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create session" do
    get(:create, session: {email: @user.email, password: @user.password})
    assert_redirected_to user_path(User.find_by(email: @user.email))
  end

  test "should go to log in page if user signed with wrong email" do
    get(:create, session: {email: 'wrong@mail.com', password: @user.password})
    assert_response :success
  end
end
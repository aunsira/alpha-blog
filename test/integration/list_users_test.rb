require 'test_helper'

class ListUsersTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'user', email: 'user@mail.com')
    @user2 = User.create(username: 'user2', email: 'user2@mail.com')
  end

  test "should show users listing" do
    get users_path
    assert_template 'users/index'
    assert_select "a[href=?]", users_path(@user), text: @user.id
    assert_select "a[href=?]", users_path(@user2), text: @user2.id
  end
end
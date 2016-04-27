require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest

  test "get new user form and create an user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: 'test',
                                           email: 'test@mail.com',
                                           password: 'pingu123'}
    end
    assert_template 'users/show'
    assert_match "Welcome", response.body
  end

  test "invalid user submission results in failure" do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post_via_redirect users_path, user: {username: 'a',
                                           email: 'test@mail.com',
                                           password: 'pingu123'}
    end
    assert_template 'users/new'
    assert_match "errors", response.body
  end

end
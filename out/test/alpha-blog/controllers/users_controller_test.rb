require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = User.create(username: 'test', email: 'aun@mail.com', password: 'pingu123', admin: true)
    @article = Article.create(title: 'title', description: 'description', user: @user)
  end

  test "should get user index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get(:show, {'id' => @user.id})
    assert_response :success
  end

  test "should get create page" do
    assert_difference 'User.count' do
      post :create, user: {username: 'test2', email: 'test2@mail.com', password: 'pingu123'}
    end
    assert_redirected_to user_path
  end
end
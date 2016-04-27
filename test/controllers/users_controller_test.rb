require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = User.create(username: 'test', email: 'test@mail.com', password: 'pingu123', admin: true)
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

  test "should get delete" do
    get(:destroy, {'id' => @user.id})
    assert_redirected_to users_path
  end

  test "should create user" do
    get(:create, user: {username: 'aun', email: 'aun@mail.com', password: 'pingu123', admin: true})
    assert_redirected_to user_path(User.find_by(username: 'aun'))
  end

  test "should update user" do
    session[:user_id] = @user.id
    put(:update, 'id' => @user.id, user: {username: 'newname', email: 'newname@mail.com', password: 'pingu123', admin: true})
    assert_redirected_to articles_path
  end
end
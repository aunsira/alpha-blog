require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  def setup
    @user = User.create(username: "test", email: "test@mail.com", password: "pingu123")
    @article = Article.create(title: "title", description: "description", user: @user)
  end

  test "article should be present" do
    assert @article.valid?
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "no logged in user shoud redirect to home page" do
    assert_no_difference 'Article.count' do
      post :create, article: {title: "changed title", description: "desc", user: nil}
    end
    assert_redirected_to root_path
  end

end
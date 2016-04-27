require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'test', email: 'test@mail.com', password: 'pingu123')
  end

  test "get new article form and create article" do
    sign_in_as(@user, 'pingu123')
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: 'title',
                                                 description: 'description',
                                                 user: @user}
    end
    assert_template 'articles/show'
    assert_match 'title', response.body
    assert_match 'description', response.body
  end

  test "invalid article submission results in failure" do
    sign_in_as(@user, 'pingu123')
    get new_article_path
    assert_template 'articles/new'
    assert_no_difference 'Article.count' do
      post articles_path, article: {title: 't',
                                    description: 'description',
                                    user: @user}
    end
    assert_template 'articles/new'
    assert_match 'errors', response.body
  end
end
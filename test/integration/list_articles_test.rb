require 'test_helper'

class ListArticlesTest < ActionDispatch::IntegrationTest

  def setup
    user = User.create(username: 'test', email: 'test@mail.com')
    @article = Article.create(title: 'title', description: 'description', user: user)
    @article2 = Article.create(title: 'title2', description: 'description2', user: user)
  end

  test "should show articles listing" do
    get articles_path
    assert_template 'articles/index'
    assert_select "a[href=?]", articles_path, text: @article.id
    assert_select "a[href=?]", articles_path, text: @article2.id
  end
end
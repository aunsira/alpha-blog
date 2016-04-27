require 'test_helper'

class ArticleCategory < ActiveSupport::TestCase

  def setup
    user = User.create(username: "test", email: "test@mail.com", password: "pingu")
    article = Article.create(title: "Test title", description: "Test description", user: user)
    category = Category.create(name: "Test")
    @article_category = ArticleCategory.new(article: article, category: category)
  end

  test "article_category should be valid" do
    assert_not @article_category.nil?
  end
end
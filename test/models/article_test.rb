require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    user = User.create(username: "test", email: "test@mail.com", password: "pingu")
    @article = Article.new(title: "Test title", description: "Test Description", user: user)
  end

  test "article should be valid" do
    assert @article.valid?
  end

  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end

  test "title should not be too long" do
    @article.title = "Title" * 100
    assert_not @article.valid?
  end

  test "title should not be too short" do
    @article.title = 'a'
    assert_not @article.valid?
  end

  test "description should be present" do
    @article.description = " "
    assert_not @article.valid?
  end

  test "descripiton should not be too long" do
    @article.description = "description" * 100
    assert_not @article.valid?
  end

  test "descripiton should not be too short" do
    @article.description = "aa"
    assert_not @article.valid?
  end

  test "relation from user should be valid" do
    @article.user = nil
    assert_not @article.valid?
  end
end
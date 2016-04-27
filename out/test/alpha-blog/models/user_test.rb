require 'test_helper'

class UsersTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "test", email: "test@mail.com", password: "pingu")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "name should be unique" do
    @user.save
    user2 = User.new(username: "test")
    assert_not user2.valid?
  end

  test "name should not be too long" do
    @user.username = "test" * 7
    assert_not @user.valid?
  end

  test "name should not be too short" do
    @user.username = "aa"
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.save
    user2 = User.create(email: "test@mail.com")
    assert_not user2.valid?
  end

  test "email should not be too long" do
    @user.email = "test" * 10 + "@mail.com"
    assert_not @user.valid?
  end
end
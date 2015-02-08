require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Example", last_name: "User", user_name: "Test", location: "Place", photo_url: "Image", bio: "Stuff")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first_name should be present" do
    @user.first_name = "     "
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = "     "
    assert_not @user.valid?
  end

  test "user_name should be present" do
    @user.user_name = "     "
    assert_not @user.valid?
  end

  test "location should be present" do
    @user.location = "     "
    assert_not @user.valid?
  end

  test "photo_url should be present" do
    @user.photo_url = "     "
    assert_not @user.valid?
  end

  test "bio should be present" do
    @user.bio = "    "
    assert_not @user.valid?
  end

  test "user_name should not be too long" do
    @user.user_name = "a" * 51
    assert_not @user.valid?
  end

end

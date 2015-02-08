require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { first_name:    "",
                               last_name:     "",
                               user_name:     "",
                               location:      "",
                               bio:           "",
                               photo_url:     ""
                             }
    end
    assert_template 'users/new'
  end
end

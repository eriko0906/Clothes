require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "should get show" do
  #   get users_show_url
  #   assert_response :success
  # end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get create" do
    get new_user_path
    assert_response :success
  end
end

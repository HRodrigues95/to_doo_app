require 'test_helper'

class DolistControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dolist_show_url
    assert_response :success
  end

  test "should get new" do
    get dolist_new_url
    assert_response :success
  end

  test "should get create" do
    get dolist_create_url
    assert_response :success
  end

  test "should get destroy" do
    get dolist_destroy_url
    assert_response :success
  end

end

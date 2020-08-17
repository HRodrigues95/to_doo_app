require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "TO DOO APP (Learning Experience)"
  end

  test "should get Root Url" do
    get root_url
    assert_response :success
    assert_select "title" , "#{@base_title}"
  end
end

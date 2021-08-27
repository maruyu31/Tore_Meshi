require 'test_helper'

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_tags_index_url
    assert_response :success
  end

end

require 'test_helper'

class Admin::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_contacts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_contacts_show_url
    assert_response :success
  end

end

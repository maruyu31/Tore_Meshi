require 'test_helper'

class Public::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_recipes_new_url
    assert_response :success
  end

  test "should get index" do
    get public_recipes_index_url
    assert_response :success
  end

  test "should get show" do
    get public_recipes_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_recipes_edit_url
    assert_response :success
  end

end

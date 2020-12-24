require 'test_helper'

class SubCatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_cat = sub_cats(:one)
  end

  test "should get index" do
    get sub_cats_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_cat_url
    assert_response :success
  end

  test "should create sub_cat" do
    assert_difference('SubCat.count') do
      post sub_cats_url, params: { sub_cat: { cat_id: @sub_cat.cat_id, name: @sub_cat.name, status: @sub_cat.status } }
    end

    assert_redirected_to sub_cat_url(SubCat.last)
  end

  test "should show sub_cat" do
    get sub_cat_url(@sub_cat)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_cat_url(@sub_cat)
    assert_response :success
  end

  test "should update sub_cat" do
    patch sub_cat_url(@sub_cat), params: { sub_cat: { cat_id: @sub_cat.cat_id, name: @sub_cat.name, status: @sub_cat.status } }
    assert_redirected_to sub_cat_url(@sub_cat)
  end

  test "should destroy sub_cat" do
    assert_difference('SubCat.count', -1) do
      delete sub_cat_url(@sub_cat)
    end

    assert_redirected_to sub_cats_url
  end
end

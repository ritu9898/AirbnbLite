require "application_system_test_case"

class SubCatsTest < ApplicationSystemTestCase
  setup do
    @sub_cat = sub_cats(:one)
  end

  test "visiting the index" do
    visit sub_cats_url
    assert_selector "h1", text: "Sub Cats"
  end

  test "creating a Sub cat" do
    visit sub_cats_url
    click_on "New Sub Cat"

    fill_in "Cat", with: @sub_cat.cat_id
    fill_in "Name", with: @sub_cat.name
    check "Status" if @sub_cat.status
    click_on "Create Sub cat"

    assert_text "Sub cat was successfully created"
    click_on "Back"
  end

  test "updating a Sub cat" do
    visit sub_cats_url
    click_on "Edit", match: :first

    fill_in "Cat", with: @sub_cat.cat_id
    fill_in "Name", with: @sub_cat.name
    check "Status" if @sub_cat.status
    click_on "Update Sub cat"

    assert_text "Sub cat was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub cat" do
    visit sub_cats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub cat was successfully destroyed"
  end
end

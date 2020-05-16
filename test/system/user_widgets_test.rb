require "application_system_test_case"

class UserWidgetsTest < ApplicationSystemTestCase
  setup do
    @user_widget = user_widgets(:one)
  end

  test "visiting the index" do
    visit user_widgets_url
    assert_selector "h1", text: "User Widgets"
  end

  test "creating a User widget" do
    visit user_widgets_url
    click_on "New User Widget"

    fill_in "User", with: @user_widget.user_id
    fill_in "Widgetable", with: @user_widget.widgetable_id
    fill_in "Widgetable type", with: @user_widget.widgetable_type
    click_on "Create User widget"

    assert_text "User widget was successfully created"
    click_on "Back"
  end

  test "updating a User widget" do
    visit user_widgets_url
    click_on "Edit", match: :first

    fill_in "User", with: @user_widget.user_id
    fill_in "Widgetable", with: @user_widget.widgetable_id
    fill_in "Widgetable type", with: @user_widget.widgetable_type
    click_on "Update User widget"

    assert_text "User widget was successfully updated"
    click_on "Back"
  end

  test "destroying a User widget" do
    visit user_widgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User widget was successfully destroyed"
  end
end

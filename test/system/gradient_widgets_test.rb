require "application_system_test_case"

class GradientWidgetsTest < ApplicationSystemTestCase
  setup do
    @gradient_widget = gradient_widgets(:one)
  end

  test "visiting the index" do
    visit gradient_widgets_url
    assert_selector "h1", text: "Gradient Widgets"
  end

  test "creating a Gradient widget" do
    visit gradient_widgets_url
    click_on "New Gradient Widget"

    fill_in "End color", with: @gradient_widget.end_color
    fill_in "Start color", with: @gradient_widget.start_color
    click_on "Create Gradient widget"

    assert_text "Gradient widget was successfully created"
    click_on "Back"
  end

  test "updating a Gradient widget" do
    visit gradient_widgets_url
    click_on "Edit", match: :first

    fill_in "End color", with: @gradient_widget.end_color
    fill_in "Start color", with: @gradient_widget.start_color
    click_on "Update Gradient widget"

    assert_text "Gradient widget was successfully updated"
    click_on "Back"
  end

  test "destroying a Gradient widget" do
    visit gradient_widgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gradient widget was successfully destroyed"
  end
end

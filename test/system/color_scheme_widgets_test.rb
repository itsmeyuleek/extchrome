require "application_system_test_case"

class ColorSchemeWidgetsTest < ApplicationSystemTestCase
  setup do
    @color_scheme_widget = color_scheme_widgets(:one)
  end

  test "visiting the index" do
    visit color_scheme_widgets_url
    assert_selector "h1", text: "Color Scheme Widgets"
  end

  test "creating a Color scheme widget" do
    visit color_scheme_widgets_url
    click_on "New Color Scheme Widget"

    click_on "Create Color scheme widget"

    assert_text "Color scheme widget was successfully created"
    click_on "Back"
  end

  test "updating a Color scheme widget" do
    visit color_scheme_widgets_url
    click_on "Edit", match: :first

    click_on "Update Color scheme widget"

    assert_text "Color scheme widget was successfully updated"
    click_on "Back"
  end

  test "destroying a Color scheme widget" do
    visit color_scheme_widgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Color scheme widget was successfully destroyed"
  end
end

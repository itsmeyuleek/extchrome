require "application_system_test_case"

class ColorBarLibraryWidgetsTest < ApplicationSystemTestCase
  setup do
    @color_bar_library_widget = color_bar_library_widgets(:one)
  end

  test "visiting the index" do
    visit color_bar_library_widgets_url
    assert_selector "h1", text: "Color Bar Library Widgets"
  end

  test "creating a Color bar library widget" do
    visit color_bar_library_widgets_url
    click_on "New Color Bar Library Widget"

    fill_in "Color", with: @color_bar_library_widget.color
    fill_in "Color position", with: @color_bar_library_widget.color_position
    click_on "Create Color bar library widget"

    assert_text "Color bar library widget was successfully created"
    click_on "Back"
  end

  test "updating a Color bar library widget" do
    visit color_bar_library_widgets_url
    click_on "Edit", match: :first

    fill_in "Color", with: @color_bar_library_widget.color
    fill_in "Color position", with: @color_bar_library_widget.color_position
    click_on "Update Color bar library widget"

    assert_text "Color bar library widget was successfully updated"
    click_on "Back"
  end

  test "destroying a Color bar library widget" do
    visit color_bar_library_widgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Color bar library widget was successfully destroyed"
  end
end

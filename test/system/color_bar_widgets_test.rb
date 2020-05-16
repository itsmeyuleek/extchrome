require "application_system_test_case"

class ColorBarWidgetsTest < ApplicationSystemTestCase
  setup do
    @color_bar_widget = color_bar_widgets(:one)
  end

  test "visiting the index" do
    visit color_bar_widgets_url
    assert_selector "h1", text: "Color Bar Widgets"
  end

  test "creating a Color bar widget" do
    visit color_bar_widgets_url
    click_on "New Color Bar Widget"

    fill_in "Color", with: @color_bar_widget.color
    click_on "Create Color bar widget"

    assert_text "Color bar widget was successfully created"
    click_on "Back"
  end

  test "updating a Color bar widget" do
    visit color_bar_widgets_url
    click_on "Edit", match: :first

    fill_in "Color", with: @color_bar_widget.color
    click_on "Update Color bar widget"

    assert_text "Color bar widget was successfully updated"
    click_on "Back"
  end

  test "destroying a Color bar widget" do
    visit color_bar_widgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Color bar widget was successfully destroyed"
  end
end

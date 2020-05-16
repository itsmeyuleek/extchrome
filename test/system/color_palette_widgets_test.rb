require "application_system_test_case"

class ColorPaletteWidgetsTest < ApplicationSystemTestCase
  setup do
    @color_palette_widget = color_palette_widgets(:one)
  end

  test "visiting the index" do
    visit color_palette_widgets_url
    assert_selector "h1", text: "Color Palette Widgets"
  end

  test "creating a Color palette widget" do
    visit color_palette_widgets_url
    click_on "New Color Palette Widget"

    fill_in "Color", with: @color_palette_widget.color
    fill_in "Type", with: @color_palette_widget.type
    click_on "Create Color palette widget"

    assert_text "Color palette widget was successfully created"
    click_on "Back"
  end

  test "updating a Color palette widget" do
    visit color_palette_widgets_url
    click_on "Edit", match: :first

    fill_in "Color", with: @color_palette_widget.color
    fill_in "Type", with: @color_palette_widget.type
    click_on "Update Color palette widget"

    assert_text "Color palette widget was successfully updated"
    click_on "Back"
  end

  test "destroying a Color palette widget" do
    visit color_palette_widgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Color palette widget was successfully destroyed"
  end
end

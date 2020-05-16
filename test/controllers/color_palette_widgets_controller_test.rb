require 'test_helper'

class ColorPaletteWidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color_palette_widget = color_palette_widgets(:one)
  end

  test "should get index" do
    get color_palette_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_color_palette_widget_url
    assert_response :success
  end

  test "should create color_palette_widget" do
    assert_difference('ColorPaletteWidget.count') do
      post color_palette_widgets_url, params: { color_palette_widget: { color: @color_palette_widget.color, type: @color_palette_widget.type } }
    end

    assert_redirected_to color_palette_widget_url(ColorPaletteWidget.last)
  end

  test "should show color_palette_widget" do
    get color_palette_widget_url(@color_palette_widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_color_palette_widget_url(@color_palette_widget)
    assert_response :success
  end

  test "should update color_palette_widget" do
    patch color_palette_widget_url(@color_palette_widget), params: { color_palette_widget: { color: @color_palette_widget.color, type: @color_palette_widget.type } }
    assert_redirected_to color_palette_widget_url(@color_palette_widget)
  end

  test "should destroy color_palette_widget" do
    assert_difference('ColorPaletteWidget.count', -1) do
      delete color_palette_widget_url(@color_palette_widget)
    end

    assert_redirected_to color_palette_widgets_url
  end
end

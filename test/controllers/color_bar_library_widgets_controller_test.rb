require 'test_helper'

class ColorBarLibraryWidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color_bar_library_widget = color_bar_library_widgets(:one)
  end

  test "should get index" do
    get color_bar_library_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_color_bar_library_widget_url
    assert_response :success
  end

  test "should create color_bar_library_widget" do
    assert_difference('ColorBarLibraryWidget.count') do
      post color_bar_library_widgets_url, params: { color_bar_library_widget: { color: @color_bar_library_widget.color, color_position: @color_bar_library_widget.color_position } }
    end

    assert_redirected_to color_bar_library_widget_url(ColorBarLibraryWidget.last)
  end

  test "should show color_bar_library_widget" do
    get color_bar_library_widget_url(@color_bar_library_widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_color_bar_library_widget_url(@color_bar_library_widget)
    assert_response :success
  end

  test "should update color_bar_library_widget" do
    patch color_bar_library_widget_url(@color_bar_library_widget), params: { color_bar_library_widget: { color: @color_bar_library_widget.color, color_position: @color_bar_library_widget.color_position } }
    assert_redirected_to color_bar_library_widget_url(@color_bar_library_widget)
  end

  test "should destroy color_bar_library_widget" do
    assert_difference('ColorBarLibraryWidget.count', -1) do
      delete color_bar_library_widget_url(@color_bar_library_widget)
    end

    assert_redirected_to color_bar_library_widgets_url
  end
end

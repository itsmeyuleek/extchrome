require 'test_helper'

class ColorSchemeWidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color_scheme_widget = color_scheme_widgets(:one)
  end

  test "should get index" do
    get color_scheme_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_color_scheme_widget_url
    assert_response :success
  end

  test "should create color_scheme_widget" do
    assert_difference('ColorSchemeWidget.count') do
      post color_scheme_widgets_url, params: { color_scheme_widget: {  } }
    end

    assert_redirected_to color_scheme_widget_url(ColorSchemeWidget.last)
  end

  test "should show color_scheme_widget" do
    get color_scheme_widget_url(@color_scheme_widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_color_scheme_widget_url(@color_scheme_widget)
    assert_response :success
  end

  test "should update color_scheme_widget" do
    patch color_scheme_widget_url(@color_scheme_widget), params: { color_scheme_widget: {  } }
    assert_redirected_to color_scheme_widget_url(@color_scheme_widget)
  end

  test "should destroy color_scheme_widget" do
    assert_difference('ColorSchemeWidget.count', -1) do
      delete color_scheme_widget_url(@color_scheme_widget)
    end

    assert_redirected_to color_scheme_widgets_url
  end
end

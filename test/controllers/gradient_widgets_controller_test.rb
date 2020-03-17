require 'test_helper'

class GradientWidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gradient_widget = gradient_widgets(:one)
  end

  test "should get index" do
    get gradient_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_gradient_widget_url
    assert_response :success
  end

  test "should create gradient_widget" do
    assert_difference('GradientWidget.count') do
      post gradient_widgets_url, params: { gradient_widget: { end_color: @gradient_widget.end_color, start_color: @gradient_widget.start_color } }
    end

    assert_redirected_to gradient_widget_url(GradientWidget.last)
  end

  test "should show gradient_widget" do
    get gradient_widget_url(@gradient_widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_gradient_widget_url(@gradient_widget)
    assert_response :success
  end

  test "should update gradient_widget" do
    patch gradient_widget_url(@gradient_widget), params: { gradient_widget: { end_color: @gradient_widget.end_color, start_color: @gradient_widget.start_color } }
    assert_redirected_to gradient_widget_url(@gradient_widget)
  end

  test "should destroy gradient_widget" do
    assert_difference('GradientWidget.count', -1) do
      delete gradient_widget_url(@gradient_widget)
    end

    assert_redirected_to gradient_widgets_url
  end
end

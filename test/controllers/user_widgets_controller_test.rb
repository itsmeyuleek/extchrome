require 'test_helper'

class UserWidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_widget = user_widgets(:one)
  end

  test "should get index" do
    get user_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_user_widget_url
    assert_response :success
  end

  test "should create user_widget" do
    assert_difference('UserWidget.count') do
      post user_widgets_url, params: { user_widget: { user_id: @user_widget.user_id, widgetable_id: @user_widget.widgetable_id, widgetable_type: @user_widget.widgetable_type } }
    end

    assert_redirected_to user_widget_url(UserWidget.last)
  end

  test "should show user_widget" do
    get user_widget_url(@user_widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_widget_url(@user_widget)
    assert_response :success
  end

  test "should update user_widget" do
    patch user_widget_url(@user_widget), params: { user_widget: { user_id: @user_widget.user_id, widgetable_id: @user_widget.widgetable_id, widgetable_type: @user_widget.widgetable_type } }
    assert_redirected_to user_widget_url(@user_widget)
  end

  test "should destroy user_widget" do
    assert_difference('UserWidget.count', -1) do
      delete user_widget_url(@user_widget)
    end

    assert_redirected_to user_widgets_url
  end
end

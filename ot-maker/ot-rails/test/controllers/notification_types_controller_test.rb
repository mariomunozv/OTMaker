require 'test_helper'

class NotificationTypesControllerTest < ActionController::TestCase
  setup do
    @notification_type = notification_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notification_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notification_type" do
    assert_difference('NotificationType.count') do
      post :create, notification_type: { name: @notification_type.name, template: @notification_type.template }
    end

    assert_redirected_to notification_type_path(assigns(:notification_type))
  end

  test "should show notification_type" do
    get :show, id: @notification_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notification_type
    assert_response :success
  end

  test "should update notification_type" do
    patch :update, id: @notification_type, notification_type: { name: @notification_type.name, template: @notification_type.template }
    assert_redirected_to notification_type_path(assigns(:notification_type))
  end

  test "should destroy notification_type" do
    assert_difference('NotificationType.count', -1) do
      delete :destroy, id: @notification_type
    end

    assert_redirected_to notification_types_path
  end
end

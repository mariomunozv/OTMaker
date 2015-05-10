require 'test_helper'

class BillOrdersControllerTest < ActionController::TestCase
  setup do
    @bill_order = bill_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bill_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill_order" do
    assert_difference('BillOrder.count') do
      post :create, bill_order: { folio: @bill_order.folio, issued: @bill_order.issued, status: @bill_order.status }
    end

    assert_redirected_to bill_order_path(assigns(:bill_order))
  end

  test "should show bill_order" do
    get :show, id: @bill_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill_order
    assert_response :success
  end

  test "should update bill_order" do
    patch :update, id: @bill_order, bill_order: { folio: @bill_order.folio, issued: @bill_order.issued, status: @bill_order.status }
    assert_redirected_to bill_order_path(assigns(:bill_order))
  end

  test "should destroy bill_order" do
    assert_difference('BillOrder.count', -1) do
      delete :destroy, id: @bill_order
    end

    assert_redirected_to bill_orders_path
  end
end

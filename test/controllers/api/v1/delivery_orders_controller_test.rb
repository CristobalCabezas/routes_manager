require "test_helper"

class Api::V1::DeliveryOrdersControllerTest < ActionDispatch::IntegrationTest
  test "renders a list of delivery orders" do
    get api_v1_delivery_orders_path
    assert_response :success
  end

  test "renders a single delivery order" do
    get api_v1_delivery_orders_path, params: { status: "pending" }
    assert_response :success
  end

  test "allow to create a new delivery order" do
    post api_v1_delivery_orders_path, params: { delivery_order: { weight_kg: 100, destination_address: "Mi Casa 123", scheduled_date: Date.today, status: "pending" } }
    assert_response :success
  end
end

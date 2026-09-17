require "test_helper"

class Api::V1::VehiclesControllerTest < ActionDispatch::IntegrationTest
  test "render a list of vehicles" do
    get api_v1_vehicles_path
    assert_response :success
  end

  test "render a single vehicle" do
    post api_v1_vehicles_path, params: { vehicle: { plate: "TJLZ93", capacity_kg: 100, driver_name: 'Maria Trinidad', status: 'available' } }
    assert_response :success
  end

  test "allow to create a new vehicle" do
    post api_v1_vehicles_path, params: { vehicle: { plate: "TJLZ93", capacity_kg: 100, driver_name: 'Maria Trinidad', status: 'available' } }
    assert_response :success
  end
end

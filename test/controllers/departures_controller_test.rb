require "test_helper"

class DeparturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @departure = departures(:one)
  end

  test "should get index" do
    get departures_url
    assert_response :success
  end

  test "should get new" do
    get new_departure_url
    assert_response :success
  end

  test "should create departure" do
    assert_difference("Departure.count") do
      post departures_url, params: { departure: { confirmed: @departure.confirmed, confirmed_time: @departure.confirmed_time, door: @departure.door, driver: @departure.driver, loaded: @departure.loaded, loaded_time: @departure.loaded_time, loader: @departure.loader, route: @departure.route, truck: @departure.truck } }
    end

    assert_redirected_to departure_url(Departure.last)
  end

  test "should show departure" do
    get departure_url(@departure)
    assert_response :success
  end

  test "should get edit" do
    get edit_departure_url(@departure)
    assert_response :success
  end

  test "should update departure" do
    patch departure_url(@departure), params: { departure: { confirmed: @departure.confirmed, confirmed_time: @departure.confirmed_time, door: @departure.door, driver: @departure.driver, loaded: @departure.loaded, loaded_time: @departure.loaded_time, loader: @departure.loader, route: @departure.route, truck: @departure.truck } }
    assert_redirected_to departure_url(@departure)
  end

  test "should destroy departure" do
    assert_difference("Departure.count", -1) do
      delete departure_url(@departure)
    end

    assert_redirected_to departures_url
  end
end

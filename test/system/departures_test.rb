require "application_system_test_case"

class DeparturesTest < ApplicationSystemTestCase
  setup do
    @departure = departures(:one)
  end

  test "visiting the index" do
    visit departures_url
    assert_selector "h1", text: "Departures"
  end

  test "should create departure" do
    visit departures_url
    click_on "New departure"

    check "Confirmed" if @departure.confirmed
    fill_in "Confirmed time", with: @departure.confirmed_time
    fill_in "Door", with: @departure.door
    fill_in "Driver", with: @departure.driver
    check "Loaded" if @departure.loaded
    fill_in "Loaded time", with: @departure.loaded_time
    fill_in "Loader", with: @departure.loader
    fill_in "Route", with: @departure.route
    fill_in "Truck", with: @departure.truck
    click_on "Create Departure"

    assert_text "Departure was successfully created"
    click_on "Back"
  end

  test "should update Departure" do
    visit departure_url(@departure)
    click_on "Edit this departure", match: :first

    check "Confirmed" if @departure.confirmed
    fill_in "Confirmed time", with: @departure.confirmed_time
    fill_in "Door", with: @departure.door
    fill_in "Driver", with: @departure.driver
    check "Loaded" if @departure.loaded
    fill_in "Loaded time", with: @departure.loaded_time
    fill_in "Loader", with: @departure.loader
    fill_in "Route", with: @departure.route
    fill_in "Truck", with: @departure.truck
    click_on "Update Departure"

    assert_text "Departure was successfully updated"
    click_on "Back"
  end

  test "should destroy Departure" do
    visit departure_url(@departure)
    click_on "Destroy this departure", match: :first

    assert_text "Departure was successfully destroyed"
  end
end

require "application_system_test_case"

class SensorsTest < ApplicationSystemTestCase
  setup do
    @sensor = sensors(:one)
  end

  test "visiting the index" do
    visit sensors_url
    assert_selector "h1", text: "Sensors"
  end

  test "creating a Sensor" do
    visit sensors_url
    click_on "New Sensor"

    fill_in "Arduino", with: @sensor.arduino_id
    fill_in "Environmental condition", with: @sensor.environmental_condition_id
    fill_in "Model", with: @sensor.model
    fill_in "Serial", with: @sensor.serial
    click_on "Create Sensor"

    assert_text "Sensor was successfully created"
    click_on "Back"
  end

  test "updating a Sensor" do
    visit sensors_url
    click_on "Edit", match: :first

    fill_in "Arduino", with: @sensor.arduino_id
    fill_in "Environmental condition", with: @sensor.environmental_condition_id
    fill_in "Model", with: @sensor.model
    fill_in "Serial", with: @sensor.serial
    click_on "Update Sensor"

    assert_text "Sensor was successfully updated"
    click_on "Back"
  end

  test "destroying a Sensor" do
    visit sensors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sensor was successfully destroyed"
  end
end

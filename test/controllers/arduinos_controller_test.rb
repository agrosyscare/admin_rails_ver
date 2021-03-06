require "test_helper"

class ArduinosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arduino = arduinos(:one)
  end

  test "should get index" do
    get arduinos_url
    assert_response :success
  end

  test "should get new" do
    get new_arduino_url
    assert_response :success
  end

  test "should create arduino" do
    assert_difference('Arduino.count') do
      post arduinos_url, params: { arduino: { model: @arduino.model, serial: @arduino.serial } }
    end

    assert_redirected_to arduino_url(Arduino.last)
  end

  test "should show arduino" do
    get arduino_url(@arduino)
    assert_response :success
  end

  test "should get edit" do
    get edit_arduino_url(@arduino)
    assert_response :success
  end

  test "should update arduino" do
    patch arduino_url(@arduino), params: { arduino: { model: @arduino.model, serial: @arduino.serial } }
    assert_redirected_to arduino_url(@arduino)
  end

  test "should destroy arduino" do
    assert_difference('Arduino.count', -1) do
      delete arduino_url(@arduino)
    end

    assert_redirected_to arduinos_url
  end
end

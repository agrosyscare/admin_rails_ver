require "application_system_test_case"

class ArduinosTest < ApplicationSystemTestCase
  setup do
    @arduino = arduinos(:one)
  end

  test "visiting the index" do
    visit arduinos_url
    assert_selector "h1", text: "Arduinos"
  end

  test "creating a Arduino" do
    visit arduinos_url
    click_on "New Arduino"

    fill_in "Model", with: @arduino.model
    fill_in "Serial", with: @arduino.serial
    click_on "Create Arduino"

    assert_text "Arduino was successfully created"
    click_on "Back"
  end

  test "updating a Arduino" do
    visit arduinos_url
    click_on "Edit", match: :first

    fill_in "Model", with: @arduino.model
    fill_in "Serial", with: @arduino.serial
    click_on "Update Arduino"

    assert_text "Arduino was successfully updated"
    click_on "Back"
  end

  test "destroying a Arduino" do
    visit arduinos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Arduino was successfully destroyed"
  end
end

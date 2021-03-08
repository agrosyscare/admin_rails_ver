require "application_system_test_case"

class GreenhousesTest < ApplicationSystemTestCase
  setup do
    @greenhouse = greenhouses(:one)
  end

  test "visiting the index" do
    visit greenhouses_url
    assert_selector "h1", text: "Greenhouses"
  end

  test "creating a Greenhouse" do
    visit greenhouses_url
    click_on "New Greenhouse"

    fill_in "Description", with: @greenhouse.description
    fill_in "Name", with: @greenhouse.name
    click_on "Create Greenhouse"

    assert_text "Greenhouse was successfully created"
    click_on "Back"
  end

  test "updating a Greenhouse" do
    visit greenhouses_url
    click_on "Edit", match: :first

    fill_in "Description", with: @greenhouse.description
    fill_in "Name", with: @greenhouse.name
    click_on "Update Greenhouse"

    assert_text "Greenhouse was successfully updated"
    click_on "Back"
  end

  test "destroying a Greenhouse" do
    visit greenhouses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Greenhouse was successfully destroyed"
  end
end

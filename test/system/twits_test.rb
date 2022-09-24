require "application_system_test_case"

class TwitsTest < ApplicationSystemTestCase
  setup do
    @twit = twits(:one)
  end

  test "visiting the index" do
    visit twits_url
    assert_selector "h1", text: "Twits"
  end

  test "should create twit" do
    visit twits_url
    click_on "New twit"

    fill_in "Twit", with: @twit.twit
    click_on "Create Twit"

    assert_text "Twit was successfully created"
    click_on "Back"
  end

  test "should update Twit" do
    visit twit_url(@twit)
    click_on "Edit this twit", match: :first

    fill_in "Twit", with: @twit.twit
    click_on "Update Twit"

    assert_text "Twit was successfully updated"
    click_on "Back"
  end

  test "should destroy Twit" do
    visit twit_url(@twit)
    click_on "Destroy this twit", match: :first

    assert_text "Twit was successfully destroyed"
  end
end

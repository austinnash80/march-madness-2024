require "application_system_test_case"

class DraftResultsTest < ApplicationSystemTestCase
  setup do
    @draft_result = draft_results(:one)
  end

  test "visiting the index" do
    visit draft_results_url
    assert_selector "h1", text: "Draft results"
  end

  test "should create draft result" do
    visit draft_results_url
    click_on "New draft result"

    fill_in "Game", with: @draft_result.game_id
    fill_in "Player", with: @draft_result.player
    fill_in "School", with: @draft_result.school_id
    click_on "Create Draft result"

    assert_text "Draft result was successfully created"
    click_on "Back"
  end

  test "should update Draft result" do
    visit draft_result_url(@draft_result)
    click_on "Edit this draft result", match: :first

    fill_in "Game", with: @draft_result.game_id
    fill_in "Player", with: @draft_result.player
    fill_in "School", with: @draft_result.school_id
    click_on "Update Draft result"

    assert_text "Draft result was successfully updated"
    click_on "Back"
  end

  test "should destroy Draft result" do
    visit draft_result_url(@draft_result)
    click_on "Destroy this draft result", match: :first

    assert_text "Draft result was successfully destroyed"
  end
end

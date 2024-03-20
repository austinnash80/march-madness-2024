require "application_system_test_case"

class DraftRanksTest < ApplicationSystemTestCase
  setup do
    @draft_rank = draft_ranks(:one)
  end

  test "visiting the index" do
    visit draft_ranks_url
    assert_selector "h1", text: "Draft ranks"
  end

  test "should create draft rank" do
    visit draft_ranks_url
    click_on "New draft rank"

    fill_in "Game", with: @draft_rank.game_id
    fill_in "Player", with: @draft_rank.player
    check "Priority" if @draft_rank.priority
    fill_in "Rank", with: @draft_rank.rank
    fill_in "School", with: @draft_rank.school_id
    check "Super priority" if @draft_rank.super_priority
    click_on "Create Draft rank"

    assert_text "Draft rank was successfully created"
    click_on "Back"
  end

  test "should update Draft rank" do
    visit draft_rank_url(@draft_rank)
    click_on "Edit this draft rank", match: :first

    fill_in "Game", with: @draft_rank.game_id
    fill_in "Player", with: @draft_rank.player
    check "Priority" if @draft_rank.priority
    fill_in "Rank", with: @draft_rank.rank
    fill_in "School", with: @draft_rank.school_id
    check "Super priority" if @draft_rank.super_priority
    click_on "Update Draft rank"

    assert_text "Draft rank was successfully updated"
    click_on "Back"
  end

  test "should destroy Draft rank" do
    visit draft_rank_url(@draft_rank)
    click_on "Destroy this draft rank", match: :first

    assert_text "Draft rank was successfully destroyed"
  end
end

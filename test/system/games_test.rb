require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "P1", with: @game.p1
    fill_in "P1 score", with: @game.p1_score
    fill_in "P2", with: @game.p2
    fill_in "P2 score", with: @game.p2_score
    fill_in "P3", with: @game.p3
    fill_in "P3 score", with: @game.p3_score
    fill_in "P4", with: @game.p4
    fill_in "P4 score", with: @game.p4_score
    fill_in "Status", with: @game.status
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "should update Game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    fill_in "P1", with: @game.p1
    fill_in "P1 score", with: @game.p1_score
    fill_in "P2", with: @game.p2
    fill_in "P2 score", with: @game.p2_score
    fill_in "P3", with: @game.p3
    fill_in "P3 score", with: @game.p3_score
    fill_in "P4", with: @game.p4
    fill_in "P4 score", with: @game.p4_score
    fill_in "Status", with: @game.status
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "should destroy Game" do
    visit game_url(@game)
    click_on "Destroy this game", match: :first

    assert_text "Game was successfully destroyed"
  end
end

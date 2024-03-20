require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url, params: { game: { p1: @game.p1, p1_score: @game.p1_score, p2: @game.p2, p2_score: @game.p2_score, p3: @game.p3, p3_score: @game.p3_score, p4: @game.p4, p4_score: @game.p4_score, status: @game.status } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { p1: @game.p1, p1_score: @game.p1_score, p2: @game.p2, p2_score: @game.p2_score, p3: @game.p3, p3_score: @game.p3_score, p4: @game.p4, p4_score: @game.p4_score, status: @game.status } }
    assert_redirected_to game_url(@game)
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end
end

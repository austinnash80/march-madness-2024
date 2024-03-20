require "test_helper"

class DraftRanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draft_rank = draft_ranks(:one)
  end

  test "should get index" do
    get draft_ranks_url
    assert_response :success
  end

  test "should get new" do
    get new_draft_rank_url
    assert_response :success
  end

  test "should create draft_rank" do
    assert_difference("DraftRank.count") do
      post draft_ranks_url, params: { draft_rank: { game_id: @draft_rank.game_id, player: @draft_rank.player, priority: @draft_rank.priority, rank: @draft_rank.rank, school_id: @draft_rank.school_id, super_priority: @draft_rank.super_priority } }
    end

    assert_redirected_to draft_rank_url(DraftRank.last)
  end

  test "should show draft_rank" do
    get draft_rank_url(@draft_rank)
    assert_response :success
  end

  test "should get edit" do
    get edit_draft_rank_url(@draft_rank)
    assert_response :success
  end

  test "should update draft_rank" do
    patch draft_rank_url(@draft_rank), params: { draft_rank: { game_id: @draft_rank.game_id, player: @draft_rank.player, priority: @draft_rank.priority, rank: @draft_rank.rank, school_id: @draft_rank.school_id, super_priority: @draft_rank.super_priority } }
    assert_redirected_to draft_rank_url(@draft_rank)
  end

  test "should destroy draft_rank" do
    assert_difference("DraftRank.count", -1) do
      delete draft_rank_url(@draft_rank)
    end

    assert_redirected_to draft_ranks_url
  end
end

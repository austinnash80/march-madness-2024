require "test_helper"

class DraftResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draft_result = draft_results(:one)
  end

  test "should get index" do
    get draft_results_url
    assert_response :success
  end

  test "should get new" do
    get new_draft_result_url
    assert_response :success
  end

  test "should create draft_result" do
    assert_difference("DraftResult.count") do
      post draft_results_url, params: { draft_result: { game_id: @draft_result.game_id, player: @draft_result.player, school_id: @draft_result.school_id } }
    end

    assert_redirected_to draft_result_url(DraftResult.last)
  end

  test "should show draft_result" do
    get draft_result_url(@draft_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_draft_result_url(@draft_result)
    assert_response :success
  end

  test "should update draft_result" do
    patch draft_result_url(@draft_result), params: { draft_result: { game_id: @draft_result.game_id, player: @draft_result.player, school_id: @draft_result.school_id } }
    assert_redirected_to draft_result_url(@draft_result)
  end

  test "should destroy draft_result" do
    assert_difference("DraftResult.count", -1) do
      delete draft_result_url(@draft_result)
    end

    assert_redirected_to draft_results_url
  end
end

require 'test_helper'

class HourlyScoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hourly_scores_index_url
    assert_response :success
  end

  test "should get new" do
    get hourly_scores_new_url
    assert_response :success
  end

  test "should get create" do
    get hourly_scores_create_url
    assert_response :success
  end

  test "should get edit" do
    get hourly_scores_edit_url
    assert_response :success
  end

  test "should get update" do
    get hourly_scores_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hourly_scores_destroy_url
    assert_response :success
  end

  test "should get show" do
    get hourly_scores_show_url
    assert_response :success
  end

end

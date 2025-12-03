require "test_helper"

class V1::TrailersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_trailers_index_url
    assert_response :success
  end

  test "should get show" do
    get v1_trailers_show_url
    assert_response :success
  end

  test "should get create" do
    get v1_trailers_create_url
    assert_response :success
  end

  test "should get update" do
    get v1_trailers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get v1_trailers_destroy_url
    assert_response :success
  end
end

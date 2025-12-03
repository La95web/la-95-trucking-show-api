require "test_helper"

class V1::DoctipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_doctips_index_url
    assert_response :success
  end
end

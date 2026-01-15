require "test_helper"

class V1::RealstatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_realstates_index_url
    assert_response :success
  end
end

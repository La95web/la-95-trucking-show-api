require "test_helper"

class V1::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_contacts_index_url
    assert_response :success
  end
end

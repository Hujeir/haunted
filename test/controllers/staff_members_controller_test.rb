require "test_helper"

class StaffMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_members_index_url
    assert_response :success
  end
end

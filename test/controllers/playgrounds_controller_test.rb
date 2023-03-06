require "test_helper"

class PlaygroundsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get playgrounds_index_url
    assert_response :success
  end
end

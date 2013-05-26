require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, :id => 'irrelevant'
    assert_response :success
  end
end

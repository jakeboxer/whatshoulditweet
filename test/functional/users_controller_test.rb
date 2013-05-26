require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get lookup" do
    get :lookup, :username => 'irrelevant'
    assert_redirected_to user_path('irrelevant')
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => 'irrelevant'
    assert_response :success
  end
end

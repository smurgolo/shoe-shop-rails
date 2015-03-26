require 'test_helper'

class StoresControllerControllerTest < ActionController::TestCase
  test "should get stores" do
    get :stores
    assert_response :success
  end

  test "should get createStore" do
    get :createStore
    assert_response :success
  end

end

require 'test_helper'

class ComprasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

require 'test_helper'

class InexportControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

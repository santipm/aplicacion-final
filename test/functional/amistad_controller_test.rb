require 'test_helper'

class AmistadControllerTest < ActionController::TestCase
  test "should get crear" do
    get :crear
    assert_response :success
  end

end

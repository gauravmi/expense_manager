require 'test_helper'

class ExpenseControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end

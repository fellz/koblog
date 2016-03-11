require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  test "should get subs" do
    get :subs
    assert_response :success
  end

  test "should get unsub" do
    get :unsub
    assert_response :success
  end

end

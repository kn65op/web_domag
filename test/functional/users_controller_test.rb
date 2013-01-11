require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "should get index" do
		get "settings" 
  	assert_response :success
		assert_not_nil assigns(:post)
	end
end

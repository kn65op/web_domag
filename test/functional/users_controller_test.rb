require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
	include Devise::TestHelpers

#main page
	
	test "should get index without user" do
		get :main_page, :locale => :pl
  	assert_response :success, "Not success"
#		assert_not_nil assigns(:posts), "Nill asssigns"
	end

	test "should get index with user" do
		sign_in users(:one)
		get :main_page, :locale => :pl
  	assert_response :success, "Not success"
	end

#settings
	test "should not get settings without user" do
		get :settings, :locale => :pl
  	assert_redirected_to new_user_session_pl_path, "Wrong success"
	end

	test "should get settings with user" do
		sign_in users(:one)
		get :settings, :locale => :pl
  	assert_response :success, "Not success"
  end

end

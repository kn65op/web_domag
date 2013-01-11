require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

#general validation of presence
	test "No new user valid" do
		user = User.new
		assert !user.save, "Saved user without email"
	end
#email validations
	test "Find, change email and save valid user" do
		user = User.find(users(:one).id)
		user.email = "SAD@example.com"
		assert user.save , "Not saved valid user with changed email"
	end

	test "Save with email that is not email" do
		user = User.new(:email => "sadasd", :password => "sssssssss")
		
		assert !user.save, "User saved with junk email"
	end

	test "Save with valid email" do 
		user = User.new(:email => "DASDDSA@example.com", :password => "SSsssssssssss")
		assert user.save, "User not saved with valid email"
	end

	test "Not save with email that is already in db" do
		user = User.new(:email => users(:one).email)
		assert !user.save, "User saved with duplicated email"
	end
#password validations
	test "Dont save user with short password" do
		user = User.new(:email => "a@example.com", :password => "12345")
		assert !user.save, "User saved with short password"
	end
end

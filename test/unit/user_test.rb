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
#thigs test

  test "User get all things" do
    things = users(:one).getThings
    assert things.size == 3, "returned not 3 things"

    beer = things.index(things(:one_beer))
    assert beer != nil, "Not found beer"

    tea = things.index(things(:one_tea))
    assert tea != nil, "Not found tea"

    bread = things.index(things(:one_bread))
    assert bread != nil, "Not found bread"
  end

  #storage validations
#  test "Not single storage" do
#    user = User.new
#    assert_equal nil, user.getStorages, "Have some storeages"
#  end

end

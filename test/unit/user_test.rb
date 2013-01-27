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

  test "Uset getThings with no Categories" do
    things = User.new.getThings
    assert things.length == 0, "Not zero things"
  end

  #for main page
  test "get valid 7 days" do
    ti = users(:one).getInvalid7Days
    assert_equal 2, ti.size, "returned not 2 t"

    beer = ti.index(thing_instances(:one_beer3))
    assert_not_nil beer, "Not found one_beer3"

    tea = ti.index(thing_instances(:one_tea1))
    assert_not_nil tea,  "Not found one_tea1"
  end

  test "get limit critical" do
    ti = users(:one).getLimitsCritical
    assert_equal 1, ti.size, "returned not 1 t"

    tea = ti.index(things(:one_tea))
    assert_not_nil tea, "Not found one_tea"
  end

  test "get limit ends" do
    ti = users(:one).getLimitsEnds
    assert_equal 1, ti.size, "returned not 1 t"

    beer = ti.index(things(:one_beer))
    assert_not_nil beer, "Not found one_beer"
  end

  test "get limit full" do
    ti = users(:one).getLimitsFull
    assert_equal 1, ti.size, "returned not 1 t"

    bread = ti.index(things(:one_bread))
    assert_not_nil bread, "Not found one_bread"
  end

  #storage validations

#  test "Not single storage" do
#    user = User.new
#    assert_equal nil, user.getStorages, "Have some storeages"
#  end

end

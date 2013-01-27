require 'test_helper'

class ThingInstancesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #amount
  test "amunt == size" do
    ti = thing_instances(:one_beer1)
    assert_equal ti.size, ti.amount, "Amount != size"
  end

  test "Consumed" do
  ti = thing_instances(:one_beer2)
  assert_equal 1.5, ti.amount, "Amount was not 1.5"
  end
end

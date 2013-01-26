require 'test_helper'

class ThingsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "No add new thing" do
    thing = Thing.new(:name => "New thing")
    assert !thing.save, "Thing saved"
  end

  test "Add new thing" do
    thing = Thing.new(:name => "New thing")
    thing.unit = "unit"
    assert thing.save, "Thing not saved"
  end

  test "Can edit my thing" do
    thing = things(:one_beer)
    assert thing.canView?(users(:one)), "cannot edit"
  end

  test "Can't edit not my thing" do
    thing = things(:two_beer)
    assert !thing.canView?(users(:one)), "can edit"
  end

end

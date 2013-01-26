require 'test_helper'

class ManufacturersTest < ActiveSupport::TestCase

  test "No add manufacturer without name" do
    man = Manufacturer.new()
    assert !man.save, "Saved manufacturer without name"
  end

  test "Add new manufacturer" do
    man = Manufacturer.new(:name => "New man")
    man.user = users(:one)
    assert man.save, "Manufacturer not saved"
  end

  test "Can view my manufacturer" do
    man = manufacturers(:one_zywiec)
    assert man.canView?(users(:one)), "cannot edit"
  end

  test "Can't view not my manufacturer" do
    man = manufacturers(:two_zywiec)
    assert !man.canView?(users(:one)), "can edit"
  end

end

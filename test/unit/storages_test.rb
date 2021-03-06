require 'test_helper'

class StoragesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
# Error due to database.
#  test "No new storage invalid" do
#    storage = Storage.new()
#    assert !storage.save, "Invalid storage saved"
#  end

  test "Valid storage save" do
    storage = Storage.new()
    storage.name = "a"
    assert storage.save, "Valid storage not saved"
  end

  test "User is admin" do
    storage = storages(:kitchen)
    assert storage.isUserAdmin?(users(:one)), "One is not admin for kitchen"
  end

  test "user is not admin for owned storage" do
    storage = storages(:good_cupboard)
    assert !storage.isUserAdmin?(users(:one)), "One is admin for good cupboard"
  end

  test "User is not admin for not owned storage" do
    storage = storages(:evil_cupboard)
    assert !storage.isUserAdmin?(users(:one)), "One is admin for evil cupboard"
  end

  test "Change admin" do
    storage = storages(:kitchen)
    assert storage.isUserAdmin?(users(:one)), "One is not admin for kitchen"
    storage.userAdmin!(users(:one), false)
    assert !storage.isUserAdmin?(users(:one)), "One is admin for kitchen - not changed"
    storage.userAdmin!(users(:one), true)
    assert storage.isUserAdmin?(users(:one)), "One is not admin for kitchen - not changed"
  end

  test "Can view true" do
    storage = storages(:kitchen)
    assert storage.canView?(users(:one))
  end

  test "Can view false" do
    storage = storages(:kitchen)
    assert !storage.canView?(users(:two))
  end

  test "Get full name nested" do
    storage = storages(:cupboard_sink)
    assert storage.getFullName == "Kitchen/Cupboard above sink", "Wrong full name nested"
  end

  test "Get full name" do
    storage = storages(:kitchen)
    assert storage.getFullName == "Kitchen", "Wrong full name for kitchen"
  end

  test "Nested 0" do
    storage = storages(:kitchen)
    assert storage.getNested == 0, "Nested not 0 for kitchen"
  end

  test "Nested 1" do
    storage = storages(:cupboard_sink)
    assert storage.getNested == 1,  "Nested not 0 for cupboaord"
  end

end

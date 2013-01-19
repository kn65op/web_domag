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

end

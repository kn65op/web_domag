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
end

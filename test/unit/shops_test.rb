require 'test_helper'

class ShopsTest < ActiveSupport::TestCase

  test "No add shop without name" do
    shop = Shop.new()
    assert !shop.save, "Saved shop without name"
  end

  test "Add new shop" do
    shop = Shop.new(:name => "New shop")
    shop.user = users(:one)
    assert shop.save, "Shop not saved"
  end

  test "Can view my shop" do
    shop = shops(:one_lidl)
    assert shop.canView?(users(:one)), "cannot edit"
  end

  test "Can't view not my shop" do
    shop = shops(:two_lidl)
    assert !shop.canView?(users(:one)), "can edit"
  end

end

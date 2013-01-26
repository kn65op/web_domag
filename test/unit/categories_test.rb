require 'test_helper'

class CategoriesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "No add category without name" do
    cat = Category.new()
    assert !cat.save, "Saved category without name"
  end

  test "Add new category" do
    cat = Category.new(:name => "New cat")
    cat.user = users(:one)
    assert cat.save, "Category not saved"
  end

  test "Can view my category" do
    cat = categories(:one_drinks)
    assert cat.canView?(users(:one)), "cannot edit"
  end

  test "Can't view not my category" do
    cat = categories(:two_drinks)
    assert !cat.canView?(users(:one)), "can edit"
  end

#  test "Get full name nested" do
#    category = categories(:cupboard_sink)
#    assert category.getFullName == "Kitchen/Cupboard above sink", "Wrong full name nested"
#  end
 #
 # test "Get full name" do
 #   category = categories(:kitchen)
 #   assert category.getFullName == "Kitchen", "Wrong full name for kitchen"
 # end

  test "Nested 0" do
    category = categories(:one_drinks)
    assert category.getNested == 0, "Nested not 0 for one_drinks"
  end

  test "Nested 1" do
    category = categories(:one_high)
    assert category.getNested == 2, "Nested not 2 for one_high"
  end

end

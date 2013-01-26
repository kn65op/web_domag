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

end

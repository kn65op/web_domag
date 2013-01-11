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
		assert cat.save, "Category not saved"
	end
end

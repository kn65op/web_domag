class Category < ActiveRecord::Base
  #attributes
	attr_accessible :description, :name, :parent
	
	#relations
	has_many :things
	has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id"
	belongs_to :parent, :class_name => "Category"
  belongs_to :user

	#validations
	validates :name, :presence => true
end

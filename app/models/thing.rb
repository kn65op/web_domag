class Thing < ActiveRecord::Base
	#attributes
  attr_accessible :descripion, :name, :unit

	#relations
	has_many :limits
	has_many :thing_instances
	belongs_to :category

  #validations
  validate :name, :presence => true
  validate :category_id, :presence => true
  validate :unit, :presence => true
end

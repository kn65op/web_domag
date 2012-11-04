class Thing < ActiveRecord::Base
	#attributes
  attr_accessible :descripion, :name, :unit

	#relations
	has_many :limits
	has_many :thing_instances
	belongs_to :category
end

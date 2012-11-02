class Thing < ActiveRecord::Base
	#attributes
  attr_accessible :descripion, :name, :unit

	#relations
	has_many :limits
end

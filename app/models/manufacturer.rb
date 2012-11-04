class Manufacturer < ActiveRecord::Base
	#attributes
  attr_accessible :name

	#relations
	has_many :thing_instances
end

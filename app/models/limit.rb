class Limit < ActiveRecord::Base
	#attributes
  attr_accessible :critical, :ends, :full

	#relations
	belongs_to :user
	belongs_to :thing
end

class Consume < ActiveRecord::Base
	#attributes
  attr_accessible :amount, :date, :purpose
	
	#relations
  belongs_to :thing_instance
end

class Consume < ActiveRecord::Base
	#attributes
  attr_accessible :date, :puprpose

	#relations
  belongs_to :thing_instance
end

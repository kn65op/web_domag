class ThingInstance < ActiveRecord::Base
	#attributes
  attr_accessible :valid_until

	#relations
  belongs_to :user
  belongs_to :storage
  belongs_to :thing
  belongs_to :purchase
	has_one :consume
end

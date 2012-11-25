class ThingInstance < ActiveRecord::Base
	#attributes
  attr_accessible :valid_until, :consume_date, :consume_purpose, :price, :purchase_date, :size

	#relations
  belongs_to :user
  belongs_to :storage
  belongs_to :thing
	belongs_to :shop
	belongs_to :manufacturer
	has_many :consumes
end

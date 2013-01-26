class ThingInstance < ActiveRecord::Base
	#attributes
  attr_accessible :valid_until, :price, :purchase_date, :size

	#relations
  belongs_to :storage
  belongs_to :thing
	belongs_to :shop
	belongs_to :manufacturer
	has_many :consumes

  #valdations
  validates :purchase_date, :presence => :true
  validates :thing_id, :presence => :true
  validates :size, :presence => :true
end

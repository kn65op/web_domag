class Shop < ActiveRecord::Base
	#attributes
  attr_accessible :address, :name

	#relations
	has_many :thing_instances
  belongs_to :user
end

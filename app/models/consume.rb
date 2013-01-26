class Consume < ActiveRecord::Base
	#attributes
  attr_accessible :amount, :date, :purpose
	
	#relations
  belongs_to :thing_instance
  belongs_to :user

  #validates
  validates :amount, :presence => :true
  validates :date, :presence => :true
end

class Shop < ActiveRecord::Base
	#attributes
  attr_accessible :address, :name

	#relations
	has_many :thing_instances
  belongs_to :user

  #validations
  validates :user, :presence => :true
  validates :name, :presence => :true

  #methods
  def canView? (u)
    user == u
  end

  def getNonZeroThingInstances
    thing_instances.find_all{|t| t.amount > 0}.sort{|a,b| a.thing.name <=> b.thing.name}
  end

end

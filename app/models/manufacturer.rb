class Manufacturer < ActiveRecord::Base
  #attributes
  attr_accessible :name

  #relations
  has_many :thing_instances
  belongs_to :user

  #methods
  def canView? (u)
    user == u
  end

end

class Manufacturer < ActiveRecord::Base
  #attributes
  attr_accessible :name

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

end

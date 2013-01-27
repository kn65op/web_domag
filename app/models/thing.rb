class Thing < ActiveRecord::Base
	#attributes
  attr_accessible :description, :name, :unit, :category_id

	#relations
	has_one :limit
	has_many :thing_instances
	belongs_to :category

  #validations
  validates :name, :presence => true
  validates :category, :presence => true
  validates :unit, :presence => true

  #methods
  def canView?(user)
    category.user == user
  end

  def amountAll
    sum = 0
    thing_instances.each{|t| sum = sum + t.amount}
    return sum
  end

end

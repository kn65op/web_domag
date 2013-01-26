class Thing < ActiveRecord::Base
	#attributes
  attr_accessible :description, :name, :unit, :category_id

	#relations
	has_many :limits
	has_many :thing_instances
	belongs_to :category

  #validations
  validates :name, :presence => true
  validates :unit, :presence => true

  #methods
  def canView?(user)
    category.user == user
  end
end

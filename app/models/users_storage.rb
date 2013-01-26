class UsersStorage < ActiveRecord::Base
	#attributes
  attr_accessible :admin

	#relations
  belongs_to :user
  belongs_to :storage

  #validations
  validates :admin, :presence => true
  validates :storage, :presence => true
  validates :user, :presence => true
end

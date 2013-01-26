class UsersStorage < ActiveRecord::Base
	#attributes
  attr_accessible :admin

	#relations
  belongs_to :user
  belongs_to :storage

  #validations
#  validates :admin, :presence => true
#  validates :storage``_id, :presence => true
#  validates :user_id, :presence => true
end

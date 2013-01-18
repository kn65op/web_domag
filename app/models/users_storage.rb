class UsersStorage < ActiveRecord::Base
	#attributes
  attr_accessible :admin

	#relations
  belongs_to :user
  belongs_to :storage
end

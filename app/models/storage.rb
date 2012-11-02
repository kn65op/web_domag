class Storage < ActiveRecord::Base
	#attributes
  attr_accessible :description, :name, :parent

	#relations
	has_many :users_storages
	has_many :users, :through => :users_storages
end

class Storage < ActiveRecord::Base
	#attributes
  attr_accessible :description, :name, :parent

	#relations
	has_many :users_storages
	has_many :users, :through => :users_storages
	has_many :thing_instances
	has_many :substorages, :class_name => "Storage", :foreign_key => "parent_id"
	belongs_to :parent, :class_name => "Storage"

end

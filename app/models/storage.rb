class Storage < ActiveRecord::Base
	#attributes
  attr_accessible :description, :name, :parent

	#relations
	has_many :users_storages
	has_many :users, :through => :users_storages
	has_many :thing_instances
	has_many :substorages, :class_name => "Storage", :foreign_key => "parent_id"
	belongs_to :parent, :class_name => "Storage"

  #validations
  validates :name, :presence => true

  def isUserAdmin?(user)
    userstorage =  UsersStorage.find_by_storage_id_and_user_id(self.id, user.id)
    if userstorage == nil
      false
    else
      userstorage.admin
    end
  end

  def userAdmin!(user, ad)
    userstorage =  UsersStorage.find_by_storage_id_and_user_id(self.id, user.id)
    userstorage.admin = ad
    userstorage.save
  end

  def canView?(user)
    users.include? user
  end

end

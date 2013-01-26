class Storage < ActiveRecord::Base
	#attributes
  attr_accessible :description, :name, :parent, :user_ids

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
    users << user
    userstorage = users_storages.find{|u| u.user == user}
    userstorage.admin = ad
    userstorage.save
  end

  def canView?(user)
    users.include? user
  end

  def getFullName
    sto = self
    full_name = name;
    while (sto.parent != nil)
      sto = sto.parent
      full_name =  sto.name + "/" + full_name
    end
    return full_name
  end

  def getNested
    i = 0
    sto = self
    while (sto.parent != nil)
      sto = sto.parent
      i = i + 1
    end
    return i
  end

end

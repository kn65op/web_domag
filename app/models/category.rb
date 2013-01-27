class Category < ActiveRecord::Base
  #attributes
	attr_accessible :description, :name, :parent
	
	#relations
	has_many :things
	has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id"
	belongs_to :parent, :class_name => "Category"
  belongs_to :user

	#validations
	validates :name, :presence => true

  #methods
  def getFullName
    cat = self
    full_name = name;
    while (cat.parent != nil)
      cat = cat.parent
      full_name =  cat.name + "/" + full_name
    end
    return full_name
  end

  def canView? (u)
    user == u
  end

  def getNested
    i = 0
    cat = self
    while (cat.parent != nil)
      cat = cat.parent
      i = i + 1
    end
    return i
  end

end

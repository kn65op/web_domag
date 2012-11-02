class Categories < ActiveRecord::Base
  attr_accessible :description, :name, :parent
end

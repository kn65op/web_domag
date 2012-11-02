class Storage < ActiveRecord::Base
  attr_accessible :description, :name, :parent
end

class Purchases < ActiveRecord::Base
  belongs_to :shop
  belongs_to :manufacturer
  attr_accessible :price
end

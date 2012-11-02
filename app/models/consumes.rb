class Consumes < ActiveRecord::Base
  belongs_to :thing_instance
  attr_accessible :date, :puprpose
end

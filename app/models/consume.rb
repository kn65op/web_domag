class Consume < ActiveRecord::Base
  belongs_to :thing_instance
  attr_accessible :date, :puprpose
end

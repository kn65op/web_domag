class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

	#relations
	has_many :limits
	has_many :users_storages
	has_many :storages, :through => :users_storages
  has_many :categories
  has_many :shops
  has_many :manufacturers

  #validations
#  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  #methods
  def getThings
    things = []
    categories.each { |c|
      things = things + c.things
    }
    return things
  end

  def getInvalid7Days
    getAllThingInstances.find_all{|t| t.valid_until < Date.today + 7.day && t.amount > 0}
  end

  def getLimitsCritical
    getAllThingsWithLimits.find_all{|t| t.limit.critical != nil && t.limit.critical > t.amountAll }
  end

  def getLimitsEnds
    getAllThingsWithLimits.find_all{|t| t.limit.ends != nil && t.limit.ends > t.amountAll && t.limit.critical < t.amountAll }
  end

  def getLimitsFull
    getAllThingsWithLimits.find_all{|t| t.limit.full != nil && t.limit.full < t.amountAll }
  end

  private
  def getAllThingInstances
    ti = []
    storages.each do |s|
      ti = ti + s.thing_instances
    end
    return ti
  end

  def getAllThings
    t = []
    categories.each do |c|
      t = t + c.things
    end
    return t
  end

  def getAllThingsWithLimits
    getAllThings.find_all{|t| t.limit != nil }
  end
end
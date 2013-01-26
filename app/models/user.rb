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
	has_many :thing_instances
	has_many :limits
	has_many :users_storages
	has_many :storages, :through => :users_storages
  has_many :categories
  has_many :shops
  has_many :manufacturers

  #validations
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  #methods
  def getThings
    things = []
    categories.each { |c|
      things = things + c.things
    }
    return things
  end
end
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

  #validations
  validate :name, :presence => true, :uniqueness => true
  validate :email, :presence => true, :uniqueness => true

  #methods

end
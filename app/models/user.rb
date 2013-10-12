class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :updates
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_presence_of :username, :on => :create
  validates_presence_of :email, :on => :create

  acts_as_liker

  has_attached_file :avatar, :styles => { :small => "150x150>", :medium => "300x300>", :thumb => "50x50>" }
end

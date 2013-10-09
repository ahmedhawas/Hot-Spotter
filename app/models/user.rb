class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :updates

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_presence_of :username, :on => :create
  validates_presence_of :email, :on => :create



end
class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  attr_accessible :username, :email, :password

  validates_presence_of :username, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :password, :on => :create
end

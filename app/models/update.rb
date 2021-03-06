class Update < ActiveRecord::Base
  belongs_to :user
  acts_as_likeable

  validates_presence_of :comment, :on => :create

  
  has_attached_file :attachment, :styles => { :medium => "300x300>", :small => "150x150>", :mini => "75x75" ,:thumb => "50x50>" }

  has_and_belongs_to_many :categories, :join_table => 'categories_updates'

end

class Update < ActiveRecord::Base
  belongs_to :user
  acts_as_likeable

  validates_presence_of :comment, :on => :create
  Firebase.base_uri = 'https://hot-spotter.firebaseio.com/'

  
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "150x150>" }

  has_and_belongs_to_many :categories, :join_table => 'categories_updates'

end

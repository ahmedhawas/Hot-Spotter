class Update < ActiveRecord::Base
  belongs_to :user
  acts_as_likeable

  validates_presence_of :comment, :on => :create
  Firebase.base_uri = 'https://hot-spotter.firebaseio.com/'

  
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "150x150>" }
end

class Update < ActiveRecord::Base
  belongs_to :user
  acts_as_likeable
end

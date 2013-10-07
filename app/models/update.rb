class Update < ActiveRecord::Base
  attr_accessible :comment

  belongs_to :user
end

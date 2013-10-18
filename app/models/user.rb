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

  has_attached_file :avatar, :styles => { :small => "170x170>", :medium => "300x300>", :thumb => "50x50>" }
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  def reputation
    if self.likes <= 2
      return "Starting"
    elsif self.likes <= 10
      return "Moderate"
    elsif self.likes <= 50
      return "Location Expert"
    else
      return "Guru"
    end   
  end

  def streak
    streak =0
    ordered_updates = self.updates.order("created_at DESC")
    if self.updates == true
      if ordered_updates[0].created_at.to_date == Time.now.to_date 
        streak+=1
        for i in 1..self.updates.length-1
          if ordered_updates[i].created_at.to_date - 1.day == Time.now - 1.day
            streak+=1
          else
            if streak == 1
              return "#{streak} day"
            else
              return "#{streak} days!"
            end
          end
        end
      end 
    else
      return "#{streak} days" 
    end
  end

end

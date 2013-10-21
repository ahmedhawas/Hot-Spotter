namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    # [User].each(&:delete_all)

    User.populate 100 do |user|
      user.username=Faker::Name.name
      user.email=Faker::Internet.email
      user.lat = 43.6561 + (rand-0.5)/15000 
      user.long = -79.3803 + (rand-0.5)/1500
    end
    User.all.each { |user| user.avatar = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample); user.save! }
  end
end
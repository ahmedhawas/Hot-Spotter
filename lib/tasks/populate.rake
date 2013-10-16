namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [User].each(&:delete_all)

    User.populate 100 do |user|
      user.username=Faker::Name.name
      user.email=Faker::Internet.email
    end
  end
end
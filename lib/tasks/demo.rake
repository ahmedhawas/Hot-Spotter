namespace :hotspotter do
  namespace :demo do
    desc "TODO"
    task liveupdates: :environment do
      for i in 0..10  
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Live Show!"
        update.likes = 0
        update.lat = 43.6561 + (rand-0.5)/15000
        update.long = -79.3803 + (rand-0.5)/1500
        update.user_id = user.id
        update.save!
        sleep(10.0)
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Just met.."
        update.likes = 0
        update.lat = 43.6617 + (rand-0.5)/15000
        update.long = -79.3950 + (rand-0.5)/1500
        update.user_id = user.id
        update.save!
      end
    end
  end
end
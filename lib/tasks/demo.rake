namespace :hotspotter do
  namespace :demo do
    desc "TODO"
    task liveupdates: :environment do
      # Generate updates with different lat and long and catgeories to generate a heat map
      # Generate large radius points
      [Update].each(&:delete_all)
      for i in 0..10  
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Restaurants"
        update.likes = 0
        update.lat = 43.7000 + (rand-0.5)/10000
        update.long = -79.4000 + (rand-0.5)/10000

        update.user_id = user.id
        update.category_ids = [7]
        update.save!
      end
      for i in 0..10  
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Restaurants"
        update.likes = 0
        update.lat = 43.6000 + (rand-0.5)/10000
        update.long = -79.3200 + (rand-0.5)/10000

        update.user_id = user.id
        update.category_ids = [7]
        update.save!
      end

      for i in 0..10  
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Hot"
        update.likes = 0
        update.lat = 43.700 + (rand-0.5)/10000
        update.long = -79.460 + (rand-0.5)/10000

        update.user_id = user.id
        update.category_ids = [8]
        update.save!
      end   
      for i in 0..10  
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Hot"
        update.likes = 0
        update.lat = 43.7300 + (rand-0.5)/10000
        update.long = -79.3000 + (rand-0.5)/10000

        update.user_id = user.id
        update.category_ids = [8]
        update.save!
      end

      for i in 0..10 
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Nightlife"
        update.likes = 0
        update.lat = 43.6700 + (rand-0.5)/10000
        update.long = -79.4100 + (rand-0.5)/10000

        update.user_id = user.id
        update.category_ids = [9]
        update.save!
      end
      for i in 0..10 
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Nightlife"
        update.likes = 0
        update.lat = 43.7000 + (rand-0.5)/10000
        update.long = -79.4000 + (rand-0.5)/10000

        update.user_id = user.id
        update.category_ids = [9]
        update.save!
      end

      for i in 0..10  
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Family Spot"
        update.likes = 0
        update.lat = 43.7230 + (rand-0.5)/10000
        update.long = -79.2230 + (rand-0.5)/10000

        update.user_id = user.id
        update.category_ids = [10]
        update.save!
      end
      for i in 0..10  
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Family Spot"
        update.likes = 0
        update.lat = 43.5300 + (rand-0.5)/10000
        update.long = -79.2300 + (rand-0.5)/10000

        update.user_id = user.id
        update.category_ids = [10]
        update.save!
      end

      for i in 0..10  
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Random"
        update.likes = 0
        update.lat = 43.120 + (rand-0.5)/10000
        update.long = -79.120 

        update.user_id = user.id
        update.category_ids = [11]
        update.save!
      end
      for i in 0..10  
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Random"
        update.likes = 0
        update.lat = 43.7120 + (rand-0.5)/10000
        update.long = -79.2000 + (rand-0.5)/10000

        update.user_id = user.id
        update.category_ids = [11]
        update.save!
      end
      # End of data used for category of heat map purposes

      # Start of data for live updates
      # comments = ["Just met...","Starbs here packed","Live show","Beautiful weather","No chicken at restaurant.."]
      # for i in 0..10  
      #   user = User.limit(1).order('RANDOM()').first
      #   update = Update.new
      #   update.comment= comments[(rand*comments.length).to_i]
      #   update.likes = 0
      #   update.lat = 43.6561 + (rand-0.5)/15000
      #   update.long = -79.3803 + (rand-0.5)/1500
      #   update.user_id = user.id
      #   update.save!
      #   sleep(10.0)
      #   user = User.limit(1).order('RANDOM()').first
      #   update = Update.new
      #   update.comment= comments[(rand*comments.length).to_i]
      #   update.likes = 0
      #   update.lat = 43.6617 + (rand-0.5)/15000
      #   update.long = -79.3950 + (rand-0.5)/1500
      #   update.user_id = user.id
      #   update.save!
      # end
    end
  end
end
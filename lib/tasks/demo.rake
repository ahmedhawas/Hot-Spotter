namespace :hotspotter do
  namespace :demo do
    desc "TODO"
    task liveupdates: :environment do
      # Generate updates with different lat and long and catgeories to generate a heat map
      # Generate large radius points
      [Update].each(&:delete_all)
      for i in 0..300 
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Restaurants"
        update.likes = 0
        random = (rand*100).to_i

        if (random < 10)
          update.lat = 43.6561 + (rand-0.5)/15000 
          update.long = -79.3803 + (rand-0.5)/1500
        elsif (random > 10 && random < 20)
          update.lat = 43.6617 + (rand-0.5)/15000 
          update.long = -79.3950 + (rand-0.5)/1500
        elsif (random > 20 && random < 30)
          update.lat =  43.650869 + (rand-0.5)/15000 
          update.long = -79.386424 + (rand-0.5)/1500
        elsif (random > 30 && random < 40)
          update.lat = 43.648761 + (rand-0.5)/15000 
          update.long = -79.396241 + (rand-0.5)/1500
        elsif (random > 40 && random < 50)
          update.lat = 43.647197 + (rand-0.5)/15000 
          update.long = -79.403993 + (rand-0.5)/1500  
        elsif (random > 50 && random < 60)
          update.lat = 43.640735 + (rand-0.5)/15000 
          update.long = -79.401380 + (rand-0.5)/1500
        elsif (random > 60 && random < 70)
          update.lat = 43.652955 + (rand-0.5)/15000 
          update.long = - 79.397932 + (rand-0.5)/1500
        elsif (random > 70 && random < 80)
          update.lat = 43.654820 + (rand-0.5)/15000 
          update.long = -79.388142 + (rand-0.5)/1500
        elsif (random > 80 && random < 90)
          update.lat = 43.649414 + (rand-0.5)/15000 
          update.long = -79.364446 + (rand-0.5)/1500
        else
          update.lat = 43.648307 + (rand-0.5)/15000 
          update.long = -79.368713 + (rand-0.5)/1500
        end
        update.user_id = user.id
        update.category_ids = [7]
        update.save!
      end
      # NightLife Data
      for i in 0..50 
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "NightLife"
        update.likes = 0
        random = (rand*100).to_i

        if (random < 10)
          update.lat = 43.649608 + (rand-0.5)/15000 
          update.long = -79.370306 + (rand-0.5)/1500
        elsif (random > 10 && random < 20)
          update.lat = 43.652783 + (rand-0.5)/15000 
          update.long = -79.369901 + (rand-0.5)/1500
        elsif (random > 20 && random < 30)
          update.lat = 43.649414  + (rand-0.5)/15000 
          update.long = -79.378721 + (rand-0.5)/1500
        else
          update.lat = 43.649227 + (rand-0.5)/15000 
          update.long = -79.378506 + (rand-0.5)/1500
        end
        update.user_id = user.id
        update.category_ids = [8]
        update.save!
      end
      # Theatre Data
      for i in 0..300 
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Theatre"
        update.likes = 0
        random = (rand*100).to_i

        if (random < 10)
          update.lat = 43.652955 + (rand-0.5)/15000 
          update.long = -79.397932 + (rand-0.5)/1500
        elsif (random > 10 && random < 20)
          update.lat = 43.641112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        elsif (random > 20 && random < 30)
          update.lat = 43.646495  + (rand-0.5)/15000 
          update.long = -79.386982 + (rand-0.5)/1500
        elsif (random > 30 && random < 40)
          update.lat = 43.645159 + (rand-0.5)/15000 
          update.long = -79.387926 + (rand-0.5)/1500
        elsif (random > 40 && random < 50)
          update.lat = 43.644585 + (rand-0.5)/15000 
          update.long = -79.386161 + (rand-0.5)/1500  
        elsif (random > 50 && random < 60)
          update.lat = 43.645866 + (rand-0.5)/15000 
          update.long = -79.385088 + (rand-0.5)/1500
        elsif (random > 60 && random < 70)
          update.lat = 43.645866 + (rand-0.5)/15000 
          update.long = -79.383436 + (rand-0.5)/1500
        else
          update.lat = 43.646068 + (rand-0.5)/15000 
          update.long = -79.385163 + (rand-0.5)/1500
        end
        update.user_id = user.id
        update.category_ids = [9]
        update.save!
      end
      # Athletic Data
      for i in 0..300 
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Athletic"
        update.likes = 0
        random = (rand*100).to_i

        if (random < 10)
          update.lat = 43.640735 + (rand-0.5)/15000 
          update.long = -79.40138 + (rand-0.5)/1500
        elsif (random > 10 && random < 20)
          update.lat = 43.341112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        elsif (random > 20 && random < 30)
          update.lat = 43.641112  + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        elsif (random > 30 && random < 40)
          update.lat = 43.641112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        elsif (random > 40 && random < 50)
          update.lat = 43.641112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500  
        elsif (random > 50 && random < 60)
          update.lat = 43.641112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        elsif (random > 60 && random < 70)
          update.lat = 43.641112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        elsif (random > 70 && random < 80)
          update.lat = 43.641112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        elsif (random > 80 && random < 90)
          update.lat = 43.641112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        else
          update.lat = 43.641112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        end
        update.user_id = user.id
        update.category_ids = [10]
        update.save!
      end
      # Family Data
      for i in 0..300 
        user = User.limit(1).order('RANDOM()').first
        update = Update.new
        update.comment= "Family"
        update.likes = 0
        random = (rand*100).to_i

        if (random < 10)
          update.lat = 43.641112 + (rand-0.5)/15000 
          update.long = -79.38967 + (rand-0.5)/1500
        elsif (random > 10 && random < 20)
          update.lat = 43.650764 + (rand-0.5)/15000 
          update.long = -79.377390 + (rand-0.5)/1500
        elsif (random > 20 && random < 30)
          update.lat =  43.670226 + (rand-0.5)/15000 
          update.long = -79.386759 + (rand-0.5)/1500
        elsif (random > 30 && random < 40)
          update.lat = 43.670226 + (rand-0.5)/15000 
          update.long = -79.386759 + (rand-0.5)/1500
        elsif (random > 40 && random < 50)
          update.lat = 43.226 + (rand-0.5)/15000 
          update.long = -79.8759 + (rand-0.5)/1500  
        elsif (random > 50 && random < 60)
          update.lat = 43.370226 + (rand-0.5)/15000 
          update.long = -79.286759 + (rand-0.5)/1500
        elsif (random > 60 && random < 70)
          update.lat = 43.517699 + (rand-0.5)/15000 
          update.long = -79.18589 + (rand-0.5)/1500
        elsif (random > 70 && random < 80)
          update.lat = 43.817699 + (rand-0.5)/15000 
          update.long = -79.18589 + (rand-0.5)/1500
        elsif (random > 80 && random < 90)
          update.lat = 43.817699 + (rand-0.5)/15000 
          update.long = -79.3389 + (rand-0.5)/1500
        else
          update.lat = 43.17699 + (rand-0.5)/15000 
          update.long = -79.8589 + (rand-0.5)/1500
        end
        update.user_id = user.id
        update.category_ids = [11]
        update.save!
      end

      

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
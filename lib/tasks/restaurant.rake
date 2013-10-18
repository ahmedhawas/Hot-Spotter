namespace :hotspotter do
  namespace :restaurant do
    desc "TODO"
    task updates: :environment do
      # Generate updates with different lat and long and catgeories to generate a heat map
      # Generate large radius points
      [Update].each(&:delete_all)

      user = User.limit(1).order('RANDOM()').first
      update = Update.new
      update.comment= "OMG Packed!!!"
      update.likes = 0
      update.lat = 43.670749
      update.long = -79.39304
      update.user_id = user.id
      update.category_ids = [7]
      update.attachment = File.open(Dir.glob(File.join(Rails.root, 'locationimages', 'restaurant_packed.jpeg')).sample)
      update.save!

      user = User.limit(1).order('RANDOM()').first
      update = Update.new
      update.comment= "Shld I eat this?!"
      update.likes = 0
      update.lat = 43.669816
      update.long = -79.393945
      update.user_id = user.id
      update.category_ids = [7]
      update.attachment = File.open(Dir.glob(File.join(Rails.root, 'locationimages', 'bad_food.jpeg')).sample)
      update.save!

      user = User.limit(1).order('RANDOM()').first
      update = Update.new
      update.comment= "Chef Yamasaki today"
      update.likes = 0
      update.lat = 43.670433
      update.long = -79.393113
      update.user_id = user.id
      update.category_ids = [7]
      update.save!

      user = User.limit(1).order('RANDOM()').first
      update = Update.new
      update.comment= "Drake here..Wharup!!"
      update.likes = 0
      update.lat = 43.671798
      update.long = -79.390908
      update.user_id = user.id
      update.category_ids = [7]
      update.attachment = File.open(Dir.glob(File.join(Rails.root, 'locationimages', 'drake.jpeg')).sample)
      update.save!
      
    end
  end
end
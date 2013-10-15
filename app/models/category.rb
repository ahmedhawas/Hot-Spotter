class Category < ActiveRecord::Base
# attributes. update_type and update_id
has_and_belongs_to_many :updates, :join_table => 'categories_updates'

end

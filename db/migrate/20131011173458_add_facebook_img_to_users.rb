class AddFacebookImgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_img, :string
  end
end

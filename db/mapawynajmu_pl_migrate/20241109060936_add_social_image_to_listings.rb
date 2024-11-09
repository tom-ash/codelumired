class AddSocialImageToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :social_image, :string, limit: 128
  end
end

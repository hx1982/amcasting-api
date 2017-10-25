class CreateProfileCompCardPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_comp_card_photos do |t|
      t.references :profile_comp_card, foreign_key: true
      t.references :profile_photo, foreign_key: true
      t.integer :sequence

      t.timestamps
    end
  end
end

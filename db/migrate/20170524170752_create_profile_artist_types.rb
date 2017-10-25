class CreateProfileArtistTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_artist_types do |t|
      t.references :profile, foreign_key: true
      t.references :artist_type, foreign_key: true
      t.boolean :is_primary
      t.integer :sequence

      t.timestamps
    end
  end
end

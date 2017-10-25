class CreateProfileVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_videos do |t|
      t.references :profile, foreign_key: true
      t.references :artist_medium, foreign_key: true
      t.boolean :is_primary
      t.integer :sequence

      t.timestamps
    end
  end
end

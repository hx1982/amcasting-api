class CreateArtistMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_media do |t|
      t.references :artist, foreign_key: true
      t.references :medium, foreign_key: true
      t.integer :sequence

      t.timestamps
    end
  end
end

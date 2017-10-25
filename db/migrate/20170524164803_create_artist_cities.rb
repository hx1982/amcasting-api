class CreateArtistCities < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_cities do |t|
      t.references :artist, foreign_key: true
      t.references :city, foreign_key: true
      t.boolean :is_primary
      t.integer :sequence

      t.timestamps
    end
  end
end

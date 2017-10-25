class CreateArtistPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_packages do |t|
      t.references :package, foreign_key: true
      t.references :artist, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_current

      t.timestamps
    end
  end
end

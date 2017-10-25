class CreateArtistPackageItems < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_package_items do |t|
      t.references :artist_package, foreign_key: true
      t.string :package_item_type_code
      t.integer :count

      t.timestamps
    end
  end
end

class CreateArtistTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_types do |t|
      t.string :code
      t.string :name
      t.string :plural_name
      t.string :description
      t.string :sequence
      t.string :parent_code

      t.timestamps
    end
  end
end

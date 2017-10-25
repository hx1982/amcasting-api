class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :address_location_type, foreign_key: true
      t.references :address_type, foreign_key: true
      t.string :street
      t.string :street2
      t.string :post_code
      t.references :country, foreign_key: true
      t.references :state, foreign_key: true
      t.references :city, foreign_key: true
      t.boolean :is_primary
      t.boolean :is_visible
      t.integer :sequence

      t.timestamps
    end
  end
end

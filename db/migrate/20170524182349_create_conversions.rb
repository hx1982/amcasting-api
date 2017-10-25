class CreateConversions < ActiveRecord::Migration[5.0]
  def change
    create_table :conversions do |t|
      t.references :profile_item_type, foreign_key: true
      t.string :profile_item_type_code
      t.integer :sequence
      t.string :uk_value
      t.string :us_value
      t.string :eu_value
      t.string :au_value
      t.string :fr_value
      t.string :jp_value

      t.timestamps
    end
  end
end

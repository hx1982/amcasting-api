class CreateProfileItemValues < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_item_values do |t|
      t.references :profile_item, foreign_key: true
      t.references :conversion, foreign_key: true
      t.references :profile_value_item_type_value, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end

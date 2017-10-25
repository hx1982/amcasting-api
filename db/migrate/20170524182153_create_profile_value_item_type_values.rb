class CreateProfileValueItemTypeValues < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_value_item_type_values do |t|
      t.string :name
      t.references :profile_item_type, foreign_key: true
      t.string :profile_item_type_code
      t.integer :level1
      t.integer :level2

      t.timestamps
    end
  end
end

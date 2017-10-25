class CreateProfileRangeItemTypeValues < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_range_item_type_values do |t|
      t.integer :min
      t.integer :max
      t.integer :step
      t.references :profile_item_type, foreign_key: true
      t.string :profile_item_type_code

      t.timestamps
    end
  end
end

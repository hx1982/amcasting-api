class CreateProfileItemTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_item_types do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :gender_code
      t.string :age_code
      t.string :value_code
      t.boolean :is_searchable
      t.boolean :is_multiple
      t.integer :group
      t.integer :sequence

      t.timestamps
    end
  end
end

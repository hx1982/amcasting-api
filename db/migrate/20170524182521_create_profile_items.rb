class CreateProfileItems < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_items do |t|
      t.references :profile, foreign_key: true
      t.references :profile_item_type, foreign_key: true
      t.string :profile_item_type_code
      t.boolean :is_display

      t.timestamps
    end
  end
end

class CreateProfileCompCardItems < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_comp_card_items do |t|
      t.references :profile_comp_card, foreign_key: true
      t.references :profile_item_type, foreign_key: true
      t.integer :sequence

      t.timestamps
    end
  end
end

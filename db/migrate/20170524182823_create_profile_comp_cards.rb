class CreateProfileCompCards < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_comp_cards do |t|
      t.references :profile, foreign_key: true
      t.integer :comp_card_type

      t.timestamps
    end
  end
end

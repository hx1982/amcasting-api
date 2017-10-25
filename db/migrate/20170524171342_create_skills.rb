class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.references :skill_group, foreign_key: true
      t.string :name
      t.string :description
      t.boolean :is_searchable
      t.integer :sequence

      t.timestamps
    end
  end
end

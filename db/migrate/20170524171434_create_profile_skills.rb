class CreateProfileSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_skills do |t|
      t.references :profile, foreign_key: true
      t.references :skill, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end

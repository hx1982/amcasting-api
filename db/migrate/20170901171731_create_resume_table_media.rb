class CreateResumeTableMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :resume_table_media do |t|
      t.references :resume_section, foreign_key: true
      t.integer :row
      t.integer :sequence
      t.references :artist_medium, foreign_key: true

      t.timestamps
    end
  end
end

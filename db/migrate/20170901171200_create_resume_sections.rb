class CreateResumeSections < ActiveRecord::Migration[5.0]
  def change
    create_table :resume_sections do |t|
      t.references :profile_resume, foreign_key: true
      t.string :title
      t.string :text
      t.boolean :is_paragraph
      t.integer :column
      t.integer :row
      t.integer :sequence

      t.timestamps
    end
  end
end

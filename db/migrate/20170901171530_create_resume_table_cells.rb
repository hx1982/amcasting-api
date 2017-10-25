class CreateResumeTableCells < ActiveRecord::Migration[5.0]
  def change
    create_table :resume_table_cells do |t|
      t.references :resume_section, foreign_key: true
      t.integer :row
      t.integer :column
      t.string :text

      t.timestamps
    end
  end
end

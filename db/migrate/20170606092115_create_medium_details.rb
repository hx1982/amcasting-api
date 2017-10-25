class CreateMediumDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :medium_details do |t|
      t.references :medium, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end

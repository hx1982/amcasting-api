class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.references :medium_type, foreign_key: true
      t.string :file_path
      t.string :file_name
      t.string :file_type
      t.bigint :file_size

      t.timestamps
    end
  end
end

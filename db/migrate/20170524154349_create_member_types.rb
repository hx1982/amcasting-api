class CreateMemberTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :member_types do |t|
      t.string :code
      t.string :name
      t.string :description
      t.integer :sequence

      t.timestamps
    end
  end
end

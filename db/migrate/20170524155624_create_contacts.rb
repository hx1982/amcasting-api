class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phone
      t.boolean :is_primary
      t.boolean :is_visible
      t.integer :sequence

      t.timestamps
    end
  end
end

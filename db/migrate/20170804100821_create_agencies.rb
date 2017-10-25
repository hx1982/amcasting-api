class CreateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :description
      t.integer :billing_month
      t.string :phone
      t.string :email
      t.boolean :is_active

      t.timestamps
    end
  end
end

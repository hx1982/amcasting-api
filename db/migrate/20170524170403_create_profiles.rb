class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :artist, foreign_key: true
      t.boolean :is_billing_profile
      t.boolean :is_active

      t.timestamps
    end
  end
end

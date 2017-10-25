class CreateMemberAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :member_addresses do |t|
      t.references :address, foreign_key: true
      t.references :member, foreign_key: true
      t.boolean :is_primary
      t.boolean :is_visible
      t.integer :sequence

      t.timestamps
    end
  end
end

class CreateMemberContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :member_contacts do |t|
      t.references :contact, foreign_key: true
      t.references :member, foreign_key: true
      t.boolean :is_primary
      t.boolean :is_visible
      t.integer :sequence

      t.timestamps
    end
  end
end

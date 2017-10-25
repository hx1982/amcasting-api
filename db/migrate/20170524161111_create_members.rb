class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender_code
      t.references :member_type, foreign_key: true
      t.references :member_source_type, foreign_key: true
      t.references :account_status_type, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :is_active

      t.timestamps
    end
  end
end

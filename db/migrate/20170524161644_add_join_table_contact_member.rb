class AddJoinTableContactMember < ActiveRecord::Migration[5.0]
  def change
    create_join_table :contacts, :members do |t|
      t.references :contact, foreign_key: true
      t.references :member, foreign_key: true
    end
  end
end

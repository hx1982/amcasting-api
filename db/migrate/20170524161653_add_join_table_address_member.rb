class AddJoinTableAddressMember < ActiveRecord::Migration[5.0]
  def change
    create_join_table :addresses, :members do |t|
      t.references :address, foreign_key: true
      t.references :member, foreign_key: true
    end
  end
end

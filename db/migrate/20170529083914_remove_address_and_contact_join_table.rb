class RemoveAddressAndContactJoinTable < ActiveRecord::Migration[5.0]
  def change
    drop_join_table :addresses, :members
    drop_join_table :contacts, :members
  end
end

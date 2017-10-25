class RemoveSequenceFromContact < ActiveRecord::Migration[5.0]
  def change
    remove_column :contacts, :sequence, :integer
    remove_column :contacts, :is_primary, :boolean
    remove_column :contacts, :is_visible, :boolean
  end
end

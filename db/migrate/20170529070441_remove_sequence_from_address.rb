class RemoveSequenceFromAddress < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :sequence, :integer
    remove_column :addresses, :is_primary, :boolean
    remove_column :addresses, :is_visible, :boolean
  end
end

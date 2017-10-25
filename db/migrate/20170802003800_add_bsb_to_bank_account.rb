class AddBsbToBankAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :bank_accounts, :bsb, :string
  end
end

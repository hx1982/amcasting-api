class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.string :bank_name
      t.string :bank_swift_code
      t.string :bank_location
      t.string :account_name
      t.string :account_number

      t.timestamps
    end
  end
end

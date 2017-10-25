class CreateSuperannuations < ActiveRecord::Migration[5.0]
  def change
    create_table :superannuations do |t|
      t.string :company
      t.string :number
      t.string :social_security_number

      t.timestamps
    end
  end
end

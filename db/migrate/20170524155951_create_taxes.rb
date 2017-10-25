class CreateTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :taxes do |t|
      t.string :juristiction
      t.string :number
      t.references :tax_type, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :number
      t.string :company_type

      t.timestamps
    end
  end
end

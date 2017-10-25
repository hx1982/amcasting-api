class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.datetime :dob
      t.boolean :is_dob_visible
      t.string :primary_occupation
      t.integer :passport_country_id
      t.string :passport_number
      t.integer :age_from
      t.integer :age_to
      t.boolean :is_age_range_auto_update
      t.references :member, foreign_key: true
      t.references :company, foreign_key: true
      t.boolean :is_company_legal_entity
      t.references :tax, foreign_key: true
      t.references :superannuation, foreign_key: true
      t.references :bank_account, foreign_key: true

      t.timestamps
    end
  end
end

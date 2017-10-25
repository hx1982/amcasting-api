class AddContactTypeRefToContact < ActiveRecord::Migration[5.0]
  def change
    add_reference :contacts, :contact_type, foreign_key: true
  end
end

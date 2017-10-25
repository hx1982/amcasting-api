class AddAgencyRefToProfile < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :agency, foreign_key: true
  end
end

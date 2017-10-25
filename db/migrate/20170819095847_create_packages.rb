class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.float :price
      t.boolean :is_retail_package
      t.boolean :is_special_package
      t.boolean :is_child_package
      t.string :country_code

      t.timestamps
    end
  end
end

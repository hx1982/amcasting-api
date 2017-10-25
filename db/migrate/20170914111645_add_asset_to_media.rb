class AddAssetToMedia < ActiveRecord::Migration[5.0]
  def change
    add_column :media, :asset, :string
  end
end

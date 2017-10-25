class AddDurationToMedium < ActiveRecord::Migration[5.0]
  def change
    add_column :media, :duration, :bigint
  end
end

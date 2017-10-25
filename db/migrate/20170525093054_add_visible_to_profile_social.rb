class AddVisibleToProfileSocial < ActiveRecord::Migration[5.0]
  def change
    add_column :profile_socials, :is_visible, :boolean
  end
end

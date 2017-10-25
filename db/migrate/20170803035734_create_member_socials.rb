class CreateMemberSocials < ActiveRecord::Migration[5.0]
  def change
    create_table :member_socials do |t|
      t.references :member, foreign_key: true
      t.references :social_type, foreign_key: true
      t.string :link
      t.boolean :is_visible

      t.timestamps
    end
  end
end

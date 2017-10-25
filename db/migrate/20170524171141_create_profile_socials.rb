class CreateProfileSocials < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_socials do |t|
      t.references :profile, foreign_key: true
      t.references :social_type, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end

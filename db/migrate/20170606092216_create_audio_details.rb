class CreateAudioDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :audio_details do |t|
      t.references :medium_detail, foreign_key: true
      t.string :gender_code
      t.integer :age_from
      t.integer :age_to
      t.string :styles

      t.timestamps
    end
  end
end

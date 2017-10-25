class CreateProfileResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_resumes do |t|
      t.string :file_path
      t.string :file_name
      t.string :description
      t.boolean :is_generated_by_credit

      t.timestamps
    end
  end
end

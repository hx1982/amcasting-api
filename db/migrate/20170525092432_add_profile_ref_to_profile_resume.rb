class AddProfileRefToProfileResume < ActiveRecord::Migration[5.0]
  def change
    add_reference :profile_resumes, :profile, foreign_key: true
  end
end

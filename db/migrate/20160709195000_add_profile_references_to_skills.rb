class AddProfileReferencesToSkills < ActiveRecord::Migration
  def change
    add_reference :skills, :profile, index: true, foreign_key: true
    add_column :skills, :proficiency, :integer
  end
end

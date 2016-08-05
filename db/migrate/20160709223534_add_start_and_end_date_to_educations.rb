class AddStartAndEndDateToEducations < ActiveRecord::Migration
  def change
  	add_column :educations, :from_date, :date
  	add_column :educations, :to_date, :date
  end
end

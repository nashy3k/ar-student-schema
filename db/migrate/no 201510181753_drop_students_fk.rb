require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class DropStudentsFk < ActiveRecord::Migration
  def change
  	change_table :students do |t|
		t.remove_foreign_key :teachers
		end
	end
end
require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudentTeachers < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :student_teachers do |t|
      t.belongs_to(:student, foreign_key: true)
      t.belongs_to(:teacher, foreign_key: true)
      t.timestamps null: false
  	end
  end
end
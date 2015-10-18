require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class ChangeStudents < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.belongs_to(:teachers, foreign_key: true)
    end
  end
end
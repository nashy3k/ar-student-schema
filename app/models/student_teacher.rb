require_relative '../../db/config'
require 'byebug'

class StudentTeacher < ActiveRecord::Base
# implement your Student model here
belongs_to :student
belongs_to :teacher

	def row
		#@name = @first_name.concat(" " + @last_name)
		"#{teachers_id} #{students_id}"
	end
end
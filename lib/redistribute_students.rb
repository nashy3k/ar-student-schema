# require_relative '../app/models/student'

# module RedistributeStudents
# 	def self
# 		i = 0
# 		num = 9
# 		until i == 53 do
# 			student = Student.find_by(id: i+1 )
# 			student.update(teachers_id: i%num+1 )
# 			i +=1 
# 			end
# 	end
# end
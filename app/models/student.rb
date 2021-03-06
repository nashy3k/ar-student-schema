require_relative '../../db/config'
require 'byebug'

class Student < ActiveRecord::Base
# implement your Student model here
has_many :student_teachers, :foreign_key => :student_id
has_many :teachers, :through => :student_teachers 

validates :email, uniqueness: true, :format => { :with =>  /\w*[@]{1,}\w{1,}[.]\w{2,}/, :message => "@ required" }
validates :age, :numericality => { :greater_than => 5}
validates :phone, :length => { :minimum => 10}, :format => { :with => /((\D*\d){10,})/ }

	def name
		#@name = @first_name.concat(" " + @last_name)
		"#{first_name} #{last_name}"
	end

	def age
		now = Date.today.year
		birthday = self.birthday.year
		age = now - birthday
	end  
end
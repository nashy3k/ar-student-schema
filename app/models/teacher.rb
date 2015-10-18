require_relative '../../db/config'
require 'byebug'

class Teacher < ActiveRecord::Base
# implement your Teacher model here

validates :email, uniqueness: true, :format => { :with =>  /\w*[@]{1,}\w{1,}[.]\w{2,}/, :message => "@ required" }
validates :age, :numericality => { :greater_than => 5}
validates :phone, :format => { :with => /((\D*\d){10,})/, message: "is not the right format" }

	def name
		"#{first_name} #{last_name}"
	end

	def age
		now = Date.today.year
		birthday = self.birthday.year
		age = now - birthday
	end  
end
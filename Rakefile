require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'
require_relative 'lib/teachers_importer'
require_relative 'lib/redistribute_students'
require_relative 'app/models/student_teacher'

task :console do
  exec "irb -r./main.rb"
end

desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:populate" do
  StudentsImporter.import  
end

desc "populate the test database with sample teachers data"
task "db:populateteachers" do
  TeachersImporter.import
end

desc 'Redistribute students across teachers evenly'
task "db:redistribute" do
		i = 0
		num = 9
		until i == (Student.last.id ) do
			student = Student.find_by(id: i+1 )
			student.update(teacher_id: i%num+1 )
			i +=1 
			end
end

desc 'Redistribute students across students_teachers evenly'
task "db:redistribute2" do
		i = 0
		num = 9
		until i == (Student.last.id ) do 
			student_teachers = StudentTeacher.find_or_create_by(teacher_id: i%num+1, student_id: i+1)
			i +=1
		end
end

desc 'Redistribute teachers across students_teachers evenly'
task "db:redistribute2teachers" do 
		i = 0
		num = 9
		until i == (Student.last.id ) do 
			student_teachers = StudentTeacher.find_or_create_by(teacher_id: i%num+1, student_id: i+1)
			i +=1
		end
end 

desc 'Retrieves students for a teacher'
task 'db:students' do
		f_name = ENV["first"]
		l_name = ENV["last"]
		teacher = Teacher.where(first_name: f_name, last_name: l_name).first
		Student.where(teacher_id: teacher.id).find_each! do |student|
		puts student.first_name + " " + student.last_name
	end
end

desc 'Retrieves students for a teacher in many to many'
task 'db:teachergetstudents' do
		f_name = ENV["first"]
		l_name = ENV["last"]
		teacher = Teacher.where(first_name: f_name, last_name: l_name).first
		Student.joins(:student_teachers).where(:student_teachers => {:teacher_id => teacher.id}).find_each do |student|
			puts student.first_name + " " + student.last_name
	end
end

desc 'Retrieves teacher for a student in many to many'
task 'db:studentgetteachers' do
		f_name = ENV["first"]
		l_name = ENV["last"]
		student = Student.where(first_name: f_name, last_name: l_name).first
		Teacher.joins(:student_teachers).where(student_teachers: {student_id: student.id} ).find_each do |teacher|
			puts teacher.first_name + " " + teacher.last_name
	end
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs

require 'rspec'
require 'date'
require_relative '../app/models/teacher'

describe Teacher, "validations" do 

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless expect(ActiveRecord::Base.connection.table_exists?(:teachers)).to eq true
    Teacher.delete_all
  end

    before(:each) do
    @teacher = Teacher.new
    @teacher.assign_attributes(
      :first_name => "Kreay",
      :last_name => "Shawn",
      :birthday => Date.new(1989,9,24),
      :gender => 'female',
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '(510) 555-1212 x4567'
    )
  end

  it "shouldn't allow two teachers with the same email" do 
	another_teacher = Teacher.create!(
		:birthday => @teacher.birthday,
		:email => @teacher.email,
		:phone => @teacher.phone
	)
	expect(@teacher).to_not be_valid
  end

end	
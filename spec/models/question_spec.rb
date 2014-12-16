require 'rails_helper'

#not passing bc not passing an employer name, not exactly sure what to do about it
RSpec.describe Question, :type => :model do

  it "should create a question" do
		a = Question.count
		#u = User.create(name: "Jim-Bob")
		e = Employer.create(name: "Ed")
		q = Question.create(title: "Question", description: "How's it going?", user_id: 1, tag_list: "yes", employer: e)
		# expect(Question.count).to be(1)
		# expect(Question.first).to eq(q)
		expect(Question.count > a).to be_truthy
	end

	it "should increment a user score" do
		u = User.create(name: "Jim-Bob")
		s = u.score
		e = Employer.create(name: "Ed")
		q = Question.create(title: "Question", description: "How's it going?", user_id: 1, tag_list: "yes", employer: e)
		p u.score
		expect(u.score > s).to eq(true)
	end
end

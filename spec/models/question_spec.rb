require 'rails_helper'

#not passing bc not passing an employer name, not exactly sure what to do about it
RSpec.describe Question, :type => :model do
  it "should create a question" do
		a = Question.count
		#u = User.create(name: "Jim-Bob")
		q = Question.create(title: "Question", description: "How's it going?", user_id: 1, tag_list: "yes")
		# expect(Question.count).to be(1)
		# expect(Question.first).to eq(q)
		expect(Question.count > a).to be_truthy
	end
end

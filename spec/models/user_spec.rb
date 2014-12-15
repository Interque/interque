require 'rails_helper'

RSpec.describe User, :type => :model do
  it "should create a user" do
		a = User.count
		u = User.create(name: "Jim-Bob")
		expect(User.count).to be(1)
		expect(User.first).to eq(u)
		expect(User.count > a).to be(true)
	end
end

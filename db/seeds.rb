# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# i = 1
# while i < 125
# 	if Question.count < 19
# 		Question.new({ title: "A question #{i}", description: "test q #{i}", user_id: 1, employer_id: 1, approved: true }).save(validate: false)
# 	elsif Answer.count < 19
# 		Answer.new({ description: "an answer #{i}", question_id: i, user_id: 1 }).save
# 	elsif User.count < 100
# 		User.new({ name: "User#{i}" }).save
# 	end
# 	i += 1
# end

User.create!(name: "", score: 52)

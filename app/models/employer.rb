class Employer < ActiveRecord::Base
	after_create :create_tag
	has_many :questions
	acts_as_taggable

	# def create_tag
	# 	Tagging.find_or_create_by(context: self.name)
	# end
end

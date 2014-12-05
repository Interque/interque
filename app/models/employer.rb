class Employer < ActiveRecord::Base
	
	has_many :questions
	acts_as_taggable
	
end

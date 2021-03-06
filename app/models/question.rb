class Question < ActiveRecord::Base
	after_save :create_tag

	belongs_to :user
	belongs_to :employer
	has_many :answers, dependent: :destroy
	has_many :comments, dependent: :destroy
	acts_as_votable
	acts_as_taggable

  validates :title, presence: true
  validates :description, presence: true

  is_impressionable

	def create_tag
		self.tag_list.add(self.employer.name.downcase)
		#find_or_create_with_like_by_name
	end

	def self.search(params)
		emp = Employer.where(name: params).take
		if emp
			Question.where(employer_id: emp.id)
		else
			Question.all  
		end
	end

	def update_score
		user.score += 10
    user.save
	end

	def score
  	self.get_upvotes.size
  end
end

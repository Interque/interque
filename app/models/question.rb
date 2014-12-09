class Question < ActiveRecord::Base
	after_save :create_tag

	belongs_to :user
	belongs_to :employer
	has_many :answers
	has_many :comments
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

		# if params
  #   	find(:all, :conditions => ['name LIKE ?', "%#{params}%"])
  # 	else
  #   	find(:all)
  # 	end
	end

	def score
  	self.get_upvotes.size
  end

end

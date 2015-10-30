class User < ActiveRecord::Base
	has_many :questions
	has_many :answers
	has_many :comments
	acts_as_voter

	validates :name, length: { minimum: 2 }

	def self.from_omniauth(auth)
		#where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.provider = auth.provider
	    user.uid      = auth.uid
	    user.name     = auth.info.name
	    user.email		= auth.info.email
	    user.save
  	end
	end

	def self.create_from_omniauth(auth)
		create! do |user|
		  user.provider = auth["provider"]
		  user.uid = auth["uid"]
		  user.name = auth["info"]["nickname"]
		  user.email ||= auth["info"]["email"]
		end
	end
end

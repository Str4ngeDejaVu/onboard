class User < ActiveRecord::Base

	# associations
	has_many :rooms

	# built into rails 4, for handling passwords
	has_secure_password

	# validations
	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

end

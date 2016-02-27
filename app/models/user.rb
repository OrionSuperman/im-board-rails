class User < ActiveRecord::Base
	has_many :usergames, dependent: :destroy
	has_many :addresses, dependent: :destroy
	has_many :games, through: :usergames
	has_many :eventusers, dependent: :destroy
	has_many :events, through: :eventusers
	has_many :hosts, class_name: "Event", foreign_key: "user_id"
	has_secure_password
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..100 }
	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..50 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :about, length: { maximum: 10000}, presence: false
	validates :description, length: { maximum: 100 }, presence: false

	def attended_count
  	count = 0
  	self.eventusers.each do |thing|
  		if thing.accepted == true
  			count += 1
  		end
  	end
  	return count
  end
end

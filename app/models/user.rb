class User < ActiveRecord::Base
	has_many :addresses
	has_one :user_info
	has_secure_password
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..50 }
	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..50 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :about, length: { in: 0..10000}
	validates :description, length: { in: 0..100 }
end

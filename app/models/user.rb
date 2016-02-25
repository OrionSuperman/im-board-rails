class User < ActiveRecord::Base
	has_many :addresses, dependent: :destroy
	has_secure_password
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..100 }
	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..50 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :about, length: { maximum: 10000}, presence: false
	validates :description, length: { maximum: 100 }, presence: false
end

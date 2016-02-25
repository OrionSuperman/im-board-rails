class Category < ActiveRecord::Base
	has_many :gamecategories
	has_many :games, through: :gamecategories
	validates :name, presence: true,  uniqueness: { case_sensitive: false }, length: { in: 1..100 }
	

	
end

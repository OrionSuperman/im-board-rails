class Skilllevel < ActiveRecord::Base
	has_many :eventskills
	has_many :events, through: :eventskills
end

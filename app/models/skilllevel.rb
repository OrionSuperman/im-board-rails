class Skilllevel < ActiveRecord::Base
	has_many :eventskills, dependent: :destroy
	has_many :events, through: :eventskills
end

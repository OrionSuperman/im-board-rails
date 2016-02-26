class Game < ActiveRecord::Base
	has_many :usergames
	has_many :users, through: :usergames
	has_many :gamecategories
	has_many :categories, through: :gamecategories
	has_many :eventgames
	has_many :events, through: :eventgames

	validates :name, :description, presence: true, length: { in: 2..100}
	validates :about, length: { maximum: 10000 }, presence: false
	validates :minplayers, :maxplayers, numericality: true, presence: false
	validates :length, presence: false, length: { in: 2..100 }


end

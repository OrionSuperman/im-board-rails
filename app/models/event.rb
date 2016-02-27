class Event < ActiveRecord::Base
  belongs_to :user
  has_many :eventusers, dependent: :destroy
  has_many :users, through: :eventusers
  has_many :eventgames, dependent: :destroy
  has_many :games, through: :eventgames
  has_many :eventskills
  has_many :skilllevels, through: :eventskills
  has_one :eventaddress, dependent: :destroy

  validates :date, :time, :title, :seats, :seats, presence: true

  validates :title, length: { in: 2..100 }

  validates :seats, numericality: true

  def accepted_user user
  	self.eventusers.each do |thing|
  		if thing.user == user and thing.accepted == true
  			return true
  		end
  	end
  	return false
  end

  def accepted_count
  	count = 0
  	self.eventusers.each do |thing|
  		if thing.accepted == true
  			count += 1
  		end
  	end
  	return count
  end

  def accepted_list
  	list = []
  	self.eventusers.each do |thing|
  		if thing.accepted == true
  			list.push(thing.user)
  		end
  	end
  	return list
  end

  def pending_user user
  	self.eventusers.each do |thing|
  		if thing.user == user and thing.pending == true
  			return true
  		end
  	end
  	return false
  end

  def pending_count
  	count = 0
  	self.eventusers.each do |thing|
  		if thing.pending == true
  			count += 1
  		end
  	end
  	return count
  end

  def pending_list
  	list = []
  	self.eventusers.each do |thing|
  		if thing.pending == true
  			list.push(thing.user)
  		end
  	end
  	return list
  end
end

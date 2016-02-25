class GameReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
end

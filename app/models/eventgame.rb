class Eventgame < ActiveRecord::Base
  belongs_to :event
  belongs_to :game
end

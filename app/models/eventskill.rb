class Eventskill < ActiveRecord::Base
  belongs_to :event
  belongs_to :skilllevel
end

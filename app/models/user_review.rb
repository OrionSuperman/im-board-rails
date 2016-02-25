class UserReview < ActiveRecord::Base
  belongs_to :by_user
  belongs_to :for_user
end

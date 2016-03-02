class Address < ActiveRecord::Base
  belongs_to :user
  validates :street1, :street2, :city, length: { maximum: 100 }
  validates :zipcode, presence: true
  validates :state, length: { is: 2}, presence: true
end

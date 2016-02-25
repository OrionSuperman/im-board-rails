class Address < ActiveRecord::Base
  belongs_to :user
  validates :street1, :street2, :city, length: { in: 0..100 }
  validates :zipcode, numericality: {only_integer: true }, length: { is: 5 }
  validates :state, length: { is: 2}
end

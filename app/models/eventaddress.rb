class Eventaddress < ActiveRecord::Base
  belongs_to :event
  validates :street1, :street2, :city, length: { in: 0..100 }
  validates :zipcode, numericality: {only_integer: true }, length: { is: 5 }, presence: true
  validates :state, length: { is: 2}, presence: true

  validates :street1, :city, presence: true


end

class Castle < ApplicationRecord
 
  after_validation :geocode, if: :address_changed?



  belongs_to :user
  validates :address, presence: true
  validates :title, presence: true
  validates :photo, presence: true
  validates :price, presence: true
  validates :city, presence: true
  validates :country, presence: true


  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

end

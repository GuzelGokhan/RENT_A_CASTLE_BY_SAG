class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  
  validates :photo, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  has_many :beds, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings
  # has_many :bookings, through: :beds
  has_attachment :photo
end

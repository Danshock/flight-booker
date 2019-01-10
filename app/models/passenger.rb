class Passenger < ApplicationRecord
	# Basic regular expression to check for legit emails
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :name, presence: true
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

	has_many :bookings, through: :passenger_bookings
	has_many :passenger_bookings
	has_many :flights, through: :bookings
end

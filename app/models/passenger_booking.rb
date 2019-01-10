class PassengerBooking < ApplicationRecord
	belongs_to :passenger
	belongs_to :booking

	validates :passenger_id, presence: true
	validates :booking_id, presence: true
end

class PassengerMailer < ApplicationMailer

	def booking_confirmation_email(passenger)
		@passenger = passenger
		@from_location = @passenger.bookings.last.flight.departure_airport.code
		@to_location = @passenger.bookings.last.flight.destination_airport.code
		@date = @passenger.bookings.last.flight.departure_date.strftime("%d/%m/%Y")
		
		mail(to: @passenger.email, subject: "Your flight has been booked!")
	end
end

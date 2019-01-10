class BookingsController < ApplicationController

	def new
		@flight  = Flight.find(params[:flight_id])
		@booking = Booking.new
		params[:passengers].to_i.times { @booking.passengers.build } 
	end

	def show
		@booking = Booking.find(params[:id])
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			@booking.passengers.each do |p|
				PassengerMailer.booking_confirmation_email(p).deliver
			end
			redirect_to booking_path(@booking)
			flash.now[:success] = "Flight has been successfully booked."
		else
			@flight = Flight.find(params[:flight_id])
			render 'new'
		end
	end


private

    def booking_params
    	params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end
end

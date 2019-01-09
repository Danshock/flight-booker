class FlightsController < ApplicationController
  def index
  	@airports = Airport.all.map do |a|
  		[a.code, a.id]
  	end
  	@dates = Flight.date_list
  	@passenger_options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  	@departure_airport = params[:departure_airport_id]
  	
  	@destination_airport = params[:destination_airport_id]
  	@depart_date = params[:departure_date]
  	@passengers = params[:passengers]

  	@flights = Flight.search(params[:departure_airport_id],
  						               params[:destination_airport_id],
  						               params[:departure_date])

  	if params[:commit] == "Search"
  		if params[:departure_airport_id] == params[:destination_airport_id]
  			flash.now[:danger] = "Your Departure and Destination airports cannot be the same."
  		end
  	end
  end
end

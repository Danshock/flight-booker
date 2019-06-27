# Empty Array for dates.
dates = []

# Sample Airport's (UK only) with their location names and codes.
airports = { "Heathrow (LHR)" => "LHR",
			 "Gatwick (LGW)" => "LGW",
			 "Manchester (MAN)" => "MAN",
			 "Glasgow (GLA)" => "GLA",
			 "Belfast International (BFS)" => "BFS",
			 "Edinburgh (EDI)" => "EDI",
			 "Newcastle (NCL)" => "NCL"}

# Create the Airports.
airports.each do |code, location|
	Airport.create(code: code, location: location)
end

# A few random dates for the dates loop.
5.times do 
	dates << (Faker::Date.forward(25))
end

# Pick a random date using the Faker gem.
def random_date_time(date)
	date = Faker::Time.between(date.beginning_of_day, date.end_of_day, :day)
	return date
end


# Make 5 flights for each Airport on each day.

# loop through all departing airports
airports.each_with_index do |depart_airport, depart_index|
  depart_airport_id = depart_index + 1

    # loop through all destination airports.
    airports.each_with_index do |destination_airport, destination_index|
  	  destination_airport_id = destination_index + 1
  	    next if destination_index == depart_index

      # loop over all the dates.
      dates.each do |date|

  	    # create 5 flights.
  	    5.times do 
  		  Flight.create(departure_airport_id: depart_airport_id,
  					    destination_airport_id: destination_airport_id,
  					    duration: rand(1..3),
  					    departure_date: random_date_time(date))
  	    end
      end
    end
end



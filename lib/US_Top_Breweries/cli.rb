class USTopBreweries::CLI

  def call
    USTopBreweries::Scraper.new.make_breweries
    puts "Welcome to the 50 Best Breweries in the United States!"
    start
  end

  def start
    puts ""
    puts "Here is a list of the top 50 Breweries in the United States."

    print_breweries(input)

    puts ""
    puts "What brewery would you like more information on?"
    input = gets.strip

    brewery = USTopBreweries::Brewery.find(input.to_i)

    print_brewery(brewery)

    puts ""
    puts "Would you like to see another brewery? Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Please drink responsibly!"
      exit
    else
      puts ""
      puts " Are you drunk? I don't understand that answer."
      start
    end
  end

  def print_brewery(brewery)
    puts ""
    puts "----------- #{brewery.name} -----------"
    puts ""
    puts "Location:           #{brewery.location}"
    puts "Type:               #{brewery.type}"
    puts "Number of Beers:    #{brewery.num_beers}"
    puts "Rating:             #{brewery.rating}"
    puts "Number of Ratings:  #{brewery.num_rating}"
    puts "Website:            #{brewery.website}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{brewery.description}"
    puts ""
  end

  def print_breweries(from_number)
    puts ""
    puts "---------- Top Breweries in the United States ----------"
    puts ""
    USTopBreweries::Brewery.all.each.with_index(from_number) do |restaurant, index|
      puts "#{index}. #{restaurant.name} - #{restaurant.location}"
    end
  end

end

require 'open-uri'
class Search

  # if search is similar "donut", "pizza",
  #Search.assign_fact
  # picks a random fact from the type
  # Search.fact 

HTTP_ERRORS = [
  OpenURI::HTTPError,
  Timeout::Error
]
  
  ID = ENV['foursquare_id']
  SECRET = ENV['foursquare_secret']

  def self.generate_random_fact
    Fact.all.sample.content
  end
  
  def self.request_ll(query, ll)
    offset = 0
    venues = []
    while offset <= 700
      api_request = "https://api.foursquare.com/v2/venues/explore?client_id=#{ID}&client_secret=#{SECRET}&query=#{query}&ll=#{ll}&radius=1000&offset=#{offset}&limit=50&v=20140806&m=foursquare"
      api_response = open(api_request).read
      @response = JSON.parse(api_response)
      @response['response']['groups'][0]['items'].each do |venue|
        if (venue['venue']['rating'] && venue['venue']['stats']['usersCount'] != 0 && (venue['venue']['stats']['checkinsCount'])/(venue['venue']['stats']['usersCount']) > 2.5 && venue['venue']['categories'][0]['name'] != "Grocery Store" && venue['venue']['categories'][0]['name'] != "Supermarket" && venue['venue']['rating'] >= 8)
          venues << venue
        end
      end
      break if offset == 700 && venues.empty?
      offset += 50
    end
    venues
  end
  
  def self.request_near(query, near)
    offset = 0
    venues = []
    while offset <= 700
      api_request = "https://api.foursquare.com/v2/venues/explore?client_id=#{ID}&client_secret=#{SECRET}&query=#{query}&near=#{near}&radius=1000&offset=#{offset}&limit=50&v=20140806&m=foursquare"
     begin
      api_response = open(api_request).read
      rescue *HTTP_ERRORS => error
        return "error message"
      end
      @response = JSON.parse(api_response)
      @response['response']['groups'][0]['items'].each do |venue|
        if (venue['venue']['rating'] && venue['venue']['stats']['usersCount'] != 0 && (venue['venue']['stats']['checkinsCount'])/(venue['venue']['stats']['usersCount']) > 2.5 && venue['venue']['categories'][0]['name'] != "Grocery Store" && venue['venue']['categories'][0]['name'] != "Supermarket" && venue['venue']['rating'] >= 8)
          venues << venue
        end
      end
      break if offset == 700 && venues.empty?
      offset += 50
    end
    venues
  end
  
end
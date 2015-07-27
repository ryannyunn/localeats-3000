require 'open-uri'
class Search
  
  ID = ENV['foursquare_id']
  SECRET = ENV['foursquare_secret']
  
  def self.request_ll(query, ll)
    offset = 0
    venues = []
    while offset <= 500
      api_request = "https://api.foursquare.com/v2/venues/explore?client_id=#{ID}&client_secret=#{SECRET}&query=#{query}&ll=#{ll}&radius=1000&offset=#{offset}&limit=50&v=20140806&m=foursquare"
      api_response = open(api_request).read
      @response = JSON.parse(api_response)
      @response['response']['groups'][0]['items'].each do |venue|
        if (venue['venue']['stats']['usersCount'] != 0 && (venue['venue']['stats']['checkinsCount'])/(venue['venue']['stats']['usersCount']) > 2.5)
          venues << venue
        end
      end
      break if offset == 500 && venues.empty?
      offset += 50
    end
    venues
  end
  
  def self.request_near(query, near)
    offset = 0
    venues = []
    while offset <= 500
      api_request = "https://api.foursquare.com/v2/venues/explore?client_id=#{ID}&client_secret=#{SECRET}&query=#{query}&near=#{near}&radius=1000&offset=#{offset}&limit=50&v=20140806&m=foursquare"
      api_response = open(api_request).read
      @response = JSON.parse(api_response)
      @response['response']['groups'][0]['items'].each do |venue|
        if (venue['venue']['stats']['usersCount'] != 0 && (venue['venue']['stats']['checkinsCount'])/(venue['venue']['stats']['usersCount']) > 2.5)
          venues << venue
        end
      end
      break if offset == 500 && venues.empty?
      offset += 50
    end
    venues
  end
  
end
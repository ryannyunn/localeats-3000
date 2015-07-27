require 'open-uri'
class Search
  
  ID = ENV['foursquare_id']
  SECRET = ENV['foursquare_secret']
  
#  validates :query, presence: :true
#  validate :given_location
#  
#  def given_location
#    if (ll == "" && near == "")
#      errors.messages[:location] = 'need location!'
#    end
#  end
#  
  def self.request_ll(query, ll)
    offset = 0
    venues = []
    
    while venues.length < 20
      api_request = "https://api.foursquare.com/v2/venues/explore?client_id=#{ID}&client_secret=#{SECRET}&query=#{query}&ll=#{ll}&radius=1000&offset=#{offset}&limit=50&v=20140806&m=foursquare"
      api_response = open(api_request).read
      @response = JSON.parse(api_response)
      
      @response['response']['groups'][0]['items'].each do |venue|
        if (venue['venue']['stats']['usersCount'] != 0 && (venue['venue']['stats']['checkinsCount'])/(venue['venue']['stats']['usersCount']) > 2.5)
          venues << venue
        end
      end
      offset += 50
    end
    venues
  end
  
  def self.request_near(query, near)
    api_request = "https://api.foursquare.com/v2/venues/explore?client_id=#{ID}&client_secret=#{SECRET}&query=#{query}&near=#{near}&radius=50&limit=50&v=20140806&m=foursquare"
    api_response = open(api_request).read
    JSON.parse(api_response)
  end
  
end
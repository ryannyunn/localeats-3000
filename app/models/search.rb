require 'open-uri'
class Search < ActiveRecord::Base
  
  ID = ENV['foursquare_id']
  SECRET = ENV['foursquare_secret']
  
  validates :query, presence: :true
  validate :given_location
  
  def given_location
    if (ll == "" && near == "")
      errors.messages[:location] = 'need location!'
    end
  end
  
  def self.request_ll(query, ll)
    api_request = "https://api.foursquare.com/v2/venues/explore?client_id=#{ID}&client_secret=#{SECRET}&query=#{query}&ll=#{ll}&radius=500&limit=50&v=20140806&m=foursquare"
    api_response = open(api_request).read
    JSON.parse(api_response)
  end
  
  def self.request_near(query, near)
    api_request = "https://api.foursquare.com/v2/venues/explore?client_id=#{ID}&client_secret=#{SECRET}&query=#{query}&near=#{near}&radius=500&limit=50&v=20140806&m=foursquare"
    api_response = open(api_request).read
    JSON.parse(api_response)
  end
  
end
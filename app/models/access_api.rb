require 'faraday'
require 'json'
require 'dotenv'
require './config/environment'


def get_location_code(zip_code)
  api_key= ENV["API_KEY"]
  url = "http://dataservice.accuweather.com/locations/v1/postalcodes/search?apikey=#{api_key}&q=#{zip_code}"
  api_response = Faraday.get(url)
  parsed_response = JSON.parse(api_response.body)
  location_code = parsed_response[0]["Key"]
end

def get_pollen_index(zip_code)
  api_key= ENV["API_KEY"]
  location_code = get_location_code(zip_code)  
  url = "http://dataservice.accuweather.com/indices/v1/daily/1day/#{location_code}/groups/30?apikey=#{api_key}&details=false"
  api_response = Faraday.get(url)
  @parsed_pollen = JSON.parse(api_response.body)
end

def get_dust_dander_index(zip_code)
  api_key= ENV["API_KEY"]
  location_code = get_location_code(zip_code)  
  url = "http://dataservice.accuweather.com//indices/v1/daily/1day/#{location_code}/18?apikey=#{api_key}"
  api_response = Faraday.get(url)
  @parsed_dust = JSON.parse(api_response.body)
end
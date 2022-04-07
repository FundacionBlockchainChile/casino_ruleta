require 'dotenv'
require 'json'
Dotenv.load


class WeatherService
  def initialize(lat=-33.4569, long=-70.6483)
    @lat = lat
    @long = long
  end

  def parse_response(response)
    @weather = []
    for day in response
      @weather.append({ "min": day['temp']['min'], "max": day['temp']['max'], "icon_img": "http://openweathermap.org/img/wn/#{day['weather'][0]['icon']}@2x.png" })
    end
    return @weather
  end

  def get_weather
    begin
      url = "#{ENV["URL"]}&appid=#{ENV["API_KEY"]}&lat=#{@lat}&lon=#{@long}"
      @response =  RestClient.get url
      @response =  JSON.parse(@response.body)['daily']
      @weather = parse_response(@response)
    rescue
      @weather = []
      8.times { @weather << { "min": 16, "max": 27, "icon_img": "http://openweathermap.org/img/wn/01d@2x.png" } }
    ensure 
      return @weather
    end
    
    
  end
end
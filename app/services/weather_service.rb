class WeatherService
  # Mejoras: Dejar como default valores para santiago, separar la lógica de parseo a metodo propio
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
    # url = "#{ENV["URL"]}&appid=#{ENV["API_KEY"]}&lat=#{@lat}&lon=#{@long}"
    url = 'https://api.openweathermap.org/data/2.5/onecall?units=metric&lat=-33.4569&lon=-70.6483&exclude=hourly,minutely,alerts&appid=a1fc67faf832b6f86b82bc0cd9cffeb3' //only dev test
    @response =  RestClient.get url
    @response =  JSON.parse(@response.body)['daily']
    @weather = parse_response(@response)
    return @weather
  end
end
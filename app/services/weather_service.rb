class WeatherService
  # Mejoras: Dejar como default valores para santiago, separar la lógica de parseo a metodo propio
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def get_weather
    url = "#{ENV["URL"]}&appid=#{ENV["API_KEY"]}&lat=#{@lat}&lon=#{@long}"
    @response =  RestClient.get url
    @response =  JSON.parse(@response.body)['daily']
    @weather = []
    for day in @response
      @weather.append({ "min": day['temp']['min'], "max": day['temp']['max'], "icon_img": "http://openweathermap.org/img/wn/#{day['weather'][0]['icon']}@2x.png" })
    end
    return @weather
  end
end
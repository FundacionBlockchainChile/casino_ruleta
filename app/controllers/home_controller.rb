require 'dotenv'
require 'json'
Dotenv.load


class HomeController < ApplicationController
  def home

    @jugadores = Jugador.all.order("created_at DESC")
    

    def get_weather
      url = "#{ENV["URL"]}&units=metric&appid=#{ENV["API_KEY"]}"
      @response =  RestClient.get url
      @response =  JSON.parse(@response.body)['daily']
      @weather = []
      for day in @response
        @weather.append({ "min": day['temp']['min'], "max": day['temp']['max'], "icon_img": "http://openweathermap.org/img/wn/#{day['weather'][0]['icon']}@2x.png" })
      end
      return @weather
    end

    @seven_days_weather = get_weather()
  end
end

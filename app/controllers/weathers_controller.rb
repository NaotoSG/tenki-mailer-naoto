require './lib/weather'

class WeathersController < ApplicationController

  def show
    weather = Weather.request_api
    @weather = weather.fetch(:weather_detail)
    @temp = weather.fetch(:temp)
    @humidity = weather.fetch(:humidity)
    @message = weather.fetch(:weather_message)
    @temperature_message = weather.fetch(:temperature_message)
    @humidity_message = weather.fetch(:humidity_message)

  end

end

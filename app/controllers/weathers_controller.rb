class WeathersController < ApplicationController

  URL = "http://api.openweathermap.org/data/2.5/weather"

  def show
    require "json"
    require "open-uri"
    require "dotenv"

      response = open(URL + "?id=#{ENV["PREFECTURE"]}&units=metric&lang=ja&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")
      # OpenWeatherMapから取得したJSONの配列をパース
      @result = JSON.parse(response.read)
      # 表示用のインスタンス変数に取得結果を格納
      @weather_detail = @result.dig("weather", 0, "description")
      @temp = @result.dig("main", "temp")
      @humidity = @result.dig("main", "humidity").round
    end
end

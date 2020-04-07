require "json"
require "open-uri"
require "dotenv"
URL = "http://api.openweathermap.org/data/2.5/weather"

class Weather < ApplicationRecord

  attr_reader :weather_detail, :temp, :humidity

  def initialize
      @weather_detail = :weather_detail
      @temp = :temp
      @humidity = :humidity
  end

  def self.request_api
    response = open(URL + "?id=#{ENV["PREFECTURE"]}&units=metric&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")
    # OpenWeatherMapから取得したJSONの配列をパース
    result = JSON.parse(response.read)
    @weather_detail = result.dig("weather", 0, "description")
    @temp = result.dig("main", "temp").round
    @humidity = result.dig("main", "humidity").round
    @weather_icon = result.dig("weather", 0, "icon")
    weather_info = {
      weather_detail: weather_detail,
      temp: @temp,
      humidity: @humidity,
      weather_message: weather_message,
      temperature_message: temperature_message,
      humidity_message: humidity_message,
      weather_icon: @weather_icon
    }
    weather_info
  end

end

private
  #雨の日にメッセージを表示するメソッド
  def weather_message
    if @weather_detail.include?("雨")
      return "雨なので傘を持っていきましょう！"
    end
  end

  # 気温により異なるメッセージを表示するメソッド
  def temperature_message
    case @temp
    when -30..0
      "気温が氷点下です。家の中で過ごしましょう"
    when 0..10
      "外は寒そうです。コートを持っていきましょう"
    when 11..25
      "すごしやすい気温です！薄着でOK"
    when 25..35
      "外はかなり暑いです！水分をとりましょう"
    when 35..50
      "今日は猛暑日です。熱中症に注意しましょう"
    else
      "異常気象です"
    end
  end

# 　湿度の違いで異なるメッセージを表示するメソッド
  def humidity_message
    case @humidity
    when 0..39
      "乾燥しています！"
    when 40..59
      "過ごしやすい湿度です"
    when 60..100
      "湿度が高くジメジメしています"
    else
      "湿度が読み取れません"
    end
  end

  #天気予報の日本語表示
  def weather_detail
      return "曇り" if @weather_detail.include?("clouds")
      return "にわか雨" if @weather_detail.include?("shower rain")
      return "小雨" if @weather_detail == "light rain"
      return "雨" if @weather_detail == "moderate rain"
      return "大雨" if @weather_detail == "heavy intensity rain"
      return "豪雨" if @weather_detail == "very heavy rain"
      return "快晴" if @weather_detail == "clear sky"
      return "雷雨" if @weather_detail == "thunderstorm"
      return "雪" if @weather_detail == "snow"
      return "霧" if @weather_detail == "mist"
      return "強風" if @weather_detail == "tornado"
      @weather_detail
  end

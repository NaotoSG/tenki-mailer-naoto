# JSONデータの取得
require "json"
# スクレイピング
require "open-uri"
# 環境変数の取得
require "dotenv"

class WeatherMailer < ApplicationMailer

  default from: 'notifications@example.com'
  URL = "http://api.openweathermap.org/data/2.5/weather"

  def weather_notification_to_user(user)

    response = open(URL + "?id=#{ENV["PREFECTURE"]}&units=metric&lang=ja&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")
    # OpenWeatherMapから取得したJSONの配列をパース
    @result = JSON.parse(response.read)
    # 表示用のインスタンス変数に取得結果を格納
    @weather_detail = @result.dig("weather", 0, "description")
    @temp = @result.dig("main", "temp")
    @humidity = @result.dig("main", "humidity").round

    @user = user
    mail(
      to: @user.email,
      subject: "今日の天気",
    )
  end
end

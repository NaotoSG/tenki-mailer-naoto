# Preview all emails at http://localhost:3000/rails/mailers/weather_mailer
class WeatherMailerPreview < ActionMailer::Preview
  def weather_notification_to_user
    WeatherMailer.weather_notification_to_user(User.first)
  end
end

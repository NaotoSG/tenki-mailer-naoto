class WeatherMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def weather_notification_to_user(user)
    @user = user
    mail(
      to: @user.email,
      subject: "今日の天気テスト"
    )
  end

end

class UsersController < ApplicationController

  def mail_deliver

    WeatherMailer.weather_notification_to_user(@user).deliver

  end

end

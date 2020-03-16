if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    port:                 587,
    address:              'smtp.gmail.com',
    domain:               'gmail.com',
    user_name:            'tenkimailer_naotosg123@gmail.com',
    password:             'hogehoge123',
    authentication:       'plain',
    enable_starttls_auto: true
  }
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener
else
  ActionMailer::Base.delivery_method = :test
end

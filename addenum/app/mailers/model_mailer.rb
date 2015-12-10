class ModelMailer < ActionMailer::Base
  default from: "postmaster@sandbox83bc023c196141e5adacf6b9b1e65788.mailgun.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_record_notification
    @greeting = "a new addendum has been added"

    mail to: "kyle.koerber@gmail.com",subject: "Success! You did it."
  end
end

class UserMailer < ActionMailer::Base
  default from: => "taskmate.ocs@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "TaskMate Registration Confirmation")
  end

end

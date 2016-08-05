class ContactsMailer < ApplicationMailer
  def notify_student(user, name, email, message)
    @user = user
    @name = name
    @email = email
    @message = message
    mail(to: @user.email, subject: "#{@user.full_name} : New message from #{name}")
  end
end

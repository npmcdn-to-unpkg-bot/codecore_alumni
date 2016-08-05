class ContactsController < ApplicationController

  def new
    @profile = params[:profile_id]
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]
    @profile = Profile.find params[:profile_id]
    ContactsMailer.notify_student(@profile.user, name, email, message).deliver_now
    redirect_to root_url, notice: "Email has been sent to the student."
  end

end

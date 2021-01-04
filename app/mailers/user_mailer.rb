class UserMailer < ApplicationMailer
	

	def new_email(user)
    @user = params[:user]
    # @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end

class Users::RegistrationsController < Devise::RegistrationsController

	# def create
	# 	binding.pry
	# 	@user = User.new(sign_up_params)
	# 	if @user.save
	# 		redirect_to root_path
	# 	else
	# 		redirect_to new_user_registration_path
	# 	end
	# end

	# def destroy
	# 	@user = User.find(params[:id])
	# 	@user.destroy

	# 	if @user.destroy?
	# 		redirect_to root_path, notice: "User deleted"

	# 	end
	# end

	def edit
		
	end

	def change_password
		# binding.pry
    if params && params[:user]
      if account_update_params[:password] == account_update_params[:password_confirmation]
        if current_user.update_attributes(password: account_update_params[:password])
          bypass_sign_in current_user
          redirect_to root_path
          flash[:notice] = 'Password Changed Successfully!'
        else
          redireact_to change_password_path
          flash[:error] = 'Enter valid password!'
        end
      else
        flash[:error] = 'Enter valid password!'
      end
    end
  end

	private

	def sign_up_params
		binding.pry
		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :host)
		if current_user.host?
			current_user.add_role :host
		else
			current_user.add_role :tenant
		UserMailer.with(user: @user).new_email.deliver_now
	end
	
	def account_update_params
		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :host)
	end
	
	
end
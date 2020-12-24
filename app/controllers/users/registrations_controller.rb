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

		 User.find(id).reset_password(password, password)
	end

	private

	def sign_up_params
		# binding.pry
		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :host)
	end
	
	def account_update_params
		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :host)
	end
	
	
end
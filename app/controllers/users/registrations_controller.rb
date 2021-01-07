class Users::RegistrationsController < Devise::RegistrationsController

	def create
		super
		binding.pry
		if params[:theme] == nil
      current_user.add_role :viewer
    else      
  		if params[:theme] == "host"
    		current_user.add_role :host
  		elsif params[:theme] == "tenant"
    		current_user.add_role :tenant
  		else
    		redirect_to new_user_session_path
    		flash[:error] = "ERROR!"
  		end  
    end
	end

	# def destroy
	# 	@user = User.find(params[:id])
	# 	@user.destroy

	# 	if @user.destroy?
	# 		redirect_to root_path, notice: "User deleted"

	# 	end
	# end

	def destroy
    	resource.soft_delete
    	Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    	set_flash_message :notice, :destroyed
    	yield resource if block_given?
    	respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  	end

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
		# binding.pry
      	params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)		
	end
	
	def account_update_params
		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
	end
	
	
end
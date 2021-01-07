class ApplicationController < ActionController::Base

# def current_user
# 	return unless session[:user_id]
#     @current_user ||= User.find(session[:user_id])
#     puts "Current User #{@current_user}"	
# end
	

  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :user_add_role

  # def after_sign_in_path_for(_resource)
  #   # binding.pry
  # 		if current_user.has_role? (:tenant)
  # 			root_path
  # 		end	
  # end

  # def user_add_role
  #   if params[:theme]
  #     # puts params[:theme]
  #     if params[:theme] == "host"
  #       current_user.add_role :host
  #     elsif params[:theme] == "tenant"
  #       current_user.add_role :tenant
  #     else
  #       redirect_to new_user_session_path
  #       flash[:error] = "ERROR!"
  #     end  
  #   end
  # end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up_params) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :host) }

  	devise_parameter_sanitizer.permit(:account_update_params) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :host) }
  end



end

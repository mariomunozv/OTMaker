class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  
  before_filter :authenticate_user!

  layout :layout_by_resource

  protected
  def configure_devise_permitted_parameters
  	registration_params = [:name, :lastname, :phone, :address, :country, :email, :password, :password_confirmation]
  	if params[:action] == 'update'
  		devise_parameter_sanitizer.for(:account_update) { 
  			|u| u.permit(registration_params << :current_password)
  		}
  	elsif params[:action] == 'create'
  		devise_parameter_sanitizer.for(:sign_up) { 
  			|u| u.permit(registration_params) 
  		}
  	end
  end

  def layout_by_resource
    if !devise_controller? || (devise_controller? && action_name == "edit") || (devise_controller? && action_name == "update")
      "application"
    else
      "devise"
    end
  end

end

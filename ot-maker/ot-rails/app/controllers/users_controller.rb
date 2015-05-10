class UsersController < ApplicationController
	before_action :set_user, only: [:update]
	
	add_breadcrumb "Mi perfil", "/profile"

	# GET /profile
	def show
		@user = current_user
	end

	# GET /profile/edit
	def edit
		add_breadcrumb "Editar perfil"
		@user = current_user
	end

	# PUT /profile/edit
	def update
		if @user.update(user_params)
	      redirect_to current_user_path, notice: 'Has actualizado tu información personal.'
	    else
	      render :edit
	    end
	end

	private
		def set_user
			@user = User.find(params[:user][:id])
		end

		def user_params
			params.require(:user).permit(:name, :lastname, :email, :phone, :avatar)
		end
end

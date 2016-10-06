class UsersController < ApplicationController
	before_action :set_user, :only => [:profile, :edit_profile, :update]
	def profile
		
	end
	def edit_profile
		
	end
	def update
		@user.update(user_params)
		redirect_to profile_user_path
	end
	private
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:email)
	end
		
end

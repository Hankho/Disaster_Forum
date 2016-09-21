class Adminhank::DisastersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
	def index
		@disasters = Disaster.all
		@users = User.all
	end
	def destroy
		
	end
		
	private
	def check_admin
		if current_user.admin?
			index
		else
			redirect_to disasters_path
		end	
	end
	
	
end
		




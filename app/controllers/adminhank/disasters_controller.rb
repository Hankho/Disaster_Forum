class Adminhank::DisastersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
	def index
		@users = User.all
		@disasters = Disaster.all
		flash[:notice] = " 管理員：#{current_user.short_name.capitalize}"
	end
	def destroy
		@disaster = Disaster.find(params[:id])
		@disaster.destroy
		redirect_to adminhank_disasters_path
	end
	private
	def check_admin
		if current_user.admin?
		else
			redirect_to disasters_path
		end	
	end
end
		




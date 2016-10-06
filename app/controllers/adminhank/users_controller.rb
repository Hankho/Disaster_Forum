class Adminhank::UsersController < ApplicationController

	def destroy
		@user = User.find(params[:id])
		if  @user.email.in? ["hankhe@gmail.com"]
			flash[:alert] = "sorry~ 此使用者為administrator您無權刪除!!"
			redirect_to adminhank_disasters_path	
		else
		    @user.destroy
			redirect_to adminhank_disasters_path
		 #unless @user.admin?
		end
		
	end

end
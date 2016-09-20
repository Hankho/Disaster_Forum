class Adminhank::DisastersController < ApplicationController
	def index
		@disasters = Disaster.all
		@users = User.all
	end

end
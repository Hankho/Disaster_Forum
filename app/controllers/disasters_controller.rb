class DisastersController < ApplicationController
	before_action :set_disaster, :only =>[:show,:edit,:update,:destroy]
	def index
		@disasters = Disaster.all
	end
	def new
		@disaster = Disaster.new
	end
	def show
		
	end
	def create
		@disaster = Disaster.new(params_disaster)
		@disaster.save
		redirect_to disasters_path
	end
	def edit
		
	end
	def update
		
		@disaster.update(params_disaster)
		redirect_to disasters_path
	end
    def destroy
    	
    	@disaster.destroy
    	redirect_to disasters_path
    end
    def params_disaster
    	params.require(:disaster).permit(:category,:title,:content)
    end
    def set_disaster
    	@disaster = Disaster.find(params[:id])
    end
end

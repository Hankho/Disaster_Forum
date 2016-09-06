class DisasterMessagesController < ApplicationController
	before_action :set_disaster 

	def index
		@messages = @disaster.messages  		#@disaster = Disaster.find(params[:disaster_id])
	end
	def show
		@message = @disaster.messages.find(params[:id])
	end
	def create
		
		@message = @disaster.messages.new(params.require(:message).permit(:message))
		@message.save
		redirect_to disaster_path(@disaster)
	end
	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		flash[:notice]="刪除成功！"
		redirect_to disaster_path(@disaster)
	end


	private 
	def set_disaster

		@disaster = Disaster.find(params[:disaster_id])
	end

	
end

class DisasterMessagesController < ApplicationController
	before_action :set_disaster
	before_action :authenticate_user!

	def index
		@messages = @disaster.messages  		#@disaster = Disaster.find(params[:disaster_id])
	end
	def show
		@message = @disaster.messages.find(params[:id])
	end
	def create
		#@disaster = Disaster.find(params[:disaster_id])
		@message = @disaster.messages.new(params.require(:message).permit(:message))
		@message.user_id = current_user.id
		if @message.save			   #當新增留言成功時,該disaster的messages_count欄位+1
		@disaster.messages_count += 1  
		@disaster.save				   #並save
		flash[:notice]="新增留言成功!"
		redirect_to disaster_path(@disaster)
		else
			flash[:alert]= "Oops create fail"
	  render :show 
		end
	end
	def destroy
		@message = Message.find(params[:id])
		if@message.destroy				#當刪除留言成功時,該disaster的messages_count欄位-1
		@disaster.messages_count -= 1	
		@disaster.save					#並save
		flash[:notice]="刪除成功！"
		redirect_to disaster_path(@disaster)
		end
	end


	private 
	def set_disaster
		@disaster = Disaster.find(params[:disaster_id])
	end
	

	
end

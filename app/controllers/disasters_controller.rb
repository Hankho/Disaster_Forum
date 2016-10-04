class DisastersController < ApplicationController
	before_action :authenticate_user!, :except => [:edit, :show]
	before_action :set_disaster, :only =>[:show,:edit,:update,:destroy]
	def index
		@user = current_user
		@disasters = Disaster.page(params[:page]).per(5)
		prepare_variable_for_index_template
	end
	def new
		@disaster = Disaster.new
	end
	# GET /disasters/about
	def about
		@users = User.all
		@messages = Message.all
		@disasters = Disaster.all
	end
	def show
		@messages = @disaster.messages
	  @disaster_message = Message.new  #new出來的物件用來給form_for塞進來的資料

	end
	def create
		@disaster = Disaster.new(params_disaster)
		@disaster.user = current_user 
			if @disaster.save
			flash[:notice]="新增成功！！"
			redirect_to disasters_path
			else
			flash[:alert]="新增失敗！！"
			render :action => :new
			end
	end
	def edit

		
	end
	def update
		if params[:_remove_tag] == "1"
			@disaster.picture = nil
		end
		if @disaster.user == current_user
			@disaster.update(params_disaster)
			redirect_to disasters_path
		else
			flash[:alert] = "sorry 你無權修改!"
			render :edit
		end
	end
    def destroy
    	if @disaster.user == current_user
    	   @disaster.destroy
    	   flash[:notice] = "刪除成功！"
    	   redirect_to disasters_path(:page=>params[:page])
    	else
    	   flash[:alert] = "你不是創建者無權刪除！"
    	   redirect_to disasters_path(:page=>params[:page])
    	end
    end
    
    
    private #private 底下的方法只有自己的class(DisastersController)可以用
    def params_disaster
    	params.require(:disaster).permit(:category, :picture, :title,:content,:group_ids=>[])
    end
    def set_disaster
    	@disaster = Disaster.find(params[:id])
    end
    def prepare_variable_for_index_template
		if  params[:order] == "title"
    		@disasters = @disasters.order("title")
    	elsif  params[:order] == "messages_count"
    		@disasters = @disasters.order("messages_count DESC")
    	else
    		@disasters
    	end
    end



end

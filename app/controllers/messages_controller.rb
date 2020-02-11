class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]    
    
    def index
        @messages = Message.all
    end

    def show
    end

    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        if @message.save
            flash[:success] = 'messageが正常に作成されました'
            redirect_to @message
        else
            flash.now[:danger] = 'messageの作成に失敗しました'
            render :new
        
        end
    end
    
    def edit
    end
    
    def update
        if @message.update(message_params)
            flash[:success] = 'messageが正常に更新されました'
            redirect_to @message
        else
            flash.now[:danger] = 'messageの更新に失敗しました'
            render :edit
        end
    end

    def destroy
        @message.delete
        flash[:success] = 'messageが正常に削除されました'
        redirect_to messages_url
    end

    private
    
    def set_message
        @message = Message.find(params[:id])
    end
    
    def message_params
        params.require(:message).permit(:content)
    end

end

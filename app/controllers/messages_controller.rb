class MessagesController < ApplicationController
  def new
  	@message = Message.new
  end

  def create
  	@message = current_user.messages.build(message_params)
    @message.user_id = params[:user_id]
    @message.chat_id = params[:chat_id]
    @message.save
  	if @message.save
  	  flash[:notice] = "Message sent!"
      @message.chat.update_attribute("status", nil)
      redirect_to user_chat_messages_path
    else
      flash[:alert] = "Message not sent"
      render 'new'
    end    
  end

  def show
  	@message = Message.find_by(id: params[:id])
  end

  def index
    @chat = Chat.find(params[:chat_id])
    @messages = @chat.messages.order('created_at ASC')
  	# @messages = Message.where(user_id: current_user.id)
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.delete
  	redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:text_message, :chat_id, :user_id)
  end
end

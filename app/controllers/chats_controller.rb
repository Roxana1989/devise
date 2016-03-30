class ChatsController < ApplicationController
  def new
    @chat = Chat.new
  end

  def create
    # if !params[:users_id].nil?

    @chat = current_user.chats.build(chat_params, )
    @chat.save
    if @chat.new_record?
      flash[:alert] = "Chat #{@chat.name} haven't been created!"
    else        
      flash[:notice] = "Users #{params[:chat][:user_id]} joined to chat #{@chat.name}!"
    end
    redirect_to user_chat_messages_path(current_user, @chat)  
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id])
    @chat.update_attributes(chat_params)
    if @chat.errors.empty?
      redirect_to user_chats_path(current_user, @chat)
    else 
      render 'edit'
    end
  end

  def index
    @chats = Chat.includes(:messages).where("chats.author = ? or chats.user_id = ?", current_user.id, current_user.id).order(updated_at: :desc)
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.delete
    redirect_to user_chats_path
  end

  def set_read
    @chat = Chat.find(params[:id])
    if @chat.update_attribute('status', true)
      redirect_to user_chats_path
    end
  end

  private

  def id(name)
    @id = Chat.find_by(name: name)
  end

  def chat_params
    params.require(:chat).permit(:name, :author, :user_id)
  end  
end

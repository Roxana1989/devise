class UsersController < ApplicationController

  def index
  	if current_user
  	 redirect_to user_chats_path(current_user)
    end
  end
end

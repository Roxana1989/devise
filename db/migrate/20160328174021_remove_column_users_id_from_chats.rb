class RemoveColumnUsersIdFromChats < ActiveRecord::Migration
  def change
  	remove_column :chats, :users_id, :string
  	add_column :chats, :user_id, :integer
  end
end

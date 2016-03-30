class AddStatusToChats < ActiveRecord::Migration
  def change
    add_column :chats, :status, :boolean
  end
end

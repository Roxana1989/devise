class AddUsersIdToChat < ActiveRecord::Migration
  def change
    add_column :chats, :users_id, :string
  end
end

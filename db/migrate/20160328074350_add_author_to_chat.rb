class AddAuthorToChat < ActiveRecord::Migration
  def change
    add_column :chats, :author, :integer
  end
end

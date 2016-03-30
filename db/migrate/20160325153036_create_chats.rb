class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.timestamps null: false
    end
  end
end

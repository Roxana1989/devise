class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :chat, index: true
      t.belongs_to :user, index: true
      t.string :text_message
      t.string :author
      t.timestamps null: false
    end
  end
end

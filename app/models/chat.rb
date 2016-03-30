class Chat < ActiveRecord::Base
  has_many :messages
  has_many :users, class_name: "Chat", foreign_key: "user_id"
end

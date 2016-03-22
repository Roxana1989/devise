class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, :email, :password, :password_confirmation, :age, presence: true
  validates :name, :email, uniqueness: true
  validates :age, length: {minimum: 0, maximum: 150}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
end

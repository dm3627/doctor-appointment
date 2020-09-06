class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :type, :email, :password, :first_name

  def access_token
  	JWT.encode({user_id: id, exp: (Time.now + 1.day).to_i}, Rails.application.secrets.secret_key_base, 'HS256')
  end
end

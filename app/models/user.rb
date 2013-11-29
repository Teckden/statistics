class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :recoverable, :trackable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
end
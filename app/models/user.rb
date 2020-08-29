class User < ApplicationRecord
  validates :email, uniqueness: { danger: "Email já cadastrado" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :recoverable, :rememberable, :validatable


end

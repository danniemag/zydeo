class User < ApplicationRecord
  validates :email, uniqueness: { danger: "Email already exists." }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :recoverable, :rememberable, :validatable
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :validatable, :confirmable

  has_many :tickets

  validates :first_name, :last_name, presence: true

  def user_initials
    "#{first_name} - #{last_name}"
  end
end

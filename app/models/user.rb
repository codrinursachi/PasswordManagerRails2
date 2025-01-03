class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :username, presence: true
  has_many :databases, dependent: :destroy
  has_many :passwords, through: :databases
end

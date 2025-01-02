class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  has_many :databases, dependent: :destroy
  has_many :passwords, through: :databases
end

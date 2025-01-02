class Database < ApplicationRecord
  belongs_to :user
  has_many :passwords, dependent: :destroy
end

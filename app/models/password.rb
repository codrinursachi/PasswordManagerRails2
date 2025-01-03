class Password < ApplicationRecord
  belongs_to :database
  belongs_to :user
end

class User < ApplicationRecord
  has_many :messages
  has_many :conversations
  validates :phone, uniqueness: true
end

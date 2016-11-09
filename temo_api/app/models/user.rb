class User < ApplicationRecord
  has_many :messages
  has_many :conversations, through: :conversations_users
  validates :phone, uniqueness: true
end

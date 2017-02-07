class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews
  validates :email, uniqueness: true
  validates :name, presence: true

end

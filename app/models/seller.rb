class Seller < ApplicationRecord
  has_secure_password
  
  has_many :products
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end

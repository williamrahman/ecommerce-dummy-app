class Product < ApplicationRecord
  enum category: { etc: 0, hardware: 1, software: 2, nonelectronic: 3 }

  belongs_to :seller
  belongs_to :order
  has_and_belongs_to_many :carts
end

class Product < ActiveRecord::Base
  has_many :carts, through: :cart_products
  has_many :cart_products, foreign_key: "product_id"
end

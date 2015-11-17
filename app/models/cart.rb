class Cart < ActiveRecord::Base
  has_many :cart_products, foreign_key: "cart_id"
  has_many :products, through: :cart_products

end

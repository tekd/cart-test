class WelcomeController < ApplicationController
  def index
    @products = Product.all
    @cart = Cart.first
    @cart_items = CartProduct.where(cart_id:@cart.id).order(created_at: 'ASC')
    @cart_qty = @cart_items.sum(:quantity)
  end
end
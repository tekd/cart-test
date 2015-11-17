class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def add_to_cart
    @cart = Cart.first
    item = CartProduct.find_by(product_id: params[:product_id])
    if item
      item.update_attributes(quantity: item.quantity += 1)
    else
      @cart.products << Product.find(params[:product_id])
    end
    redirect_to root_path
  end

  def remove_from_cart
    @cart = Cart.first
    item = CartProduct.find_by(product_id: params[:product_id])
    if item.quantity <= 1
      item.destroy
    else
      item.update_attributes(quantity: item.quantity -= 1)
    end
      redirect_to :back
  end

  def get_cart_total_cost(cart_items)
    total_cost = []
    cart_items.each do |item|
      total_cost << (item.quantity * item.product.price)
    end
    total_cost
  end

  def get_cart_total(cart_items)
    cart_items.map {|p| p.product.price * p.quantity}.inject(:+).round(2)
  end

  def show
    @cart = Cart.first
    @cart_items = CartProduct.where(cart_id:@cart.id).order(created_at: 'ASC')
    @cart_qty = @cart_items.sum(:quantity)
    @cart_total = get_cart_total(@cart_items)
    @cart.update_attributes(total:@cart_total)
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart
    else
      redirect_to root_path
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.save
      redirect_to @cart
    else
      redirect_to root_path
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end

private

def cart_params
  params.require(:cart).permit(:total)
end

end
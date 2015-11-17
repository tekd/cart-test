class OrderCost < ActiveRecord::Base
    def index
      @order_costs = OrderCost.all
    end

    def show
      @order_cost = OrderCost.find(params[:id])
    end

    def new
      @order_cost = OrderCost.new
    end

    def create
      @order_cost = OrderCost.new(order_cost_params)
      if @order_cost.save
        redirect_to @order_cost
      else
        redirect_to root_path
      end
    end

    def edit
      @order_cost = OrderCost.find(params[:id])
    end

    def update
      @order_cost = OrderCost.find(params[:id])
      if @order_cost.save
        redirect_to @order_cost
      else
        redirect_to root_path
      end
    end

    def destroy
      @order_cost = OrderCost.find(params[:id])
      @order_cost.destroy
    end

  private

  def order_cost_params
    params.require(:order_cost).permit(:destination,:cost)
  end
end

class Api::OrderCostsController < Api::ApiController

def index
  render json: OrderCost.all
end

end
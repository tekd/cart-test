class ProductsController
  include ActionController::MimeResponds
    def index
      @products = Product.all
    end

    def show
      @product = Product.find(params[:id])
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to @product
      else
        redirect_to root_path
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.save
        redirect_to @product
      else
        redirect_to root_path
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
    end

  private

  def product_params
    params.require(:product).permit(:name,:total)
  end


end
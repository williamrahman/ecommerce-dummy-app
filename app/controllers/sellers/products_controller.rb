module Sellers
  class ProductsController < SellerBaseController
    def index
      @products = Product.all
    end

    def new 
      @product = Product.new()
    end

    def create
      @product = Product.new(product_params)
      @product.seller = current_user

      if @product.save!
        flash[:success] = "Create Product Success"
      else
        flash[:error] = "There was a problem creating the Product"
      end
      redirect_to sellers_products_path
    end

    private
    def product_params
      params.require(:product).permit(:name, :category, :price)
    end
  end
end

module Customers
  class DashboardController < CustomerBaseController
    before_action :authenticate!
    
    def show
      @cart = current_user.cart
    end
  
    def add_to_cart
      product = Product.find(params[:product_id])
      current_customer.cart.products << product
  
      flash[:success] = "#{product.name} has been added to your cart."
      redirect_to product
    end
  
    def remove_from_cart
      product = Product.find(params[:product_id])
      current_customer.cart.products.delete(product)
  
      flash[:success] = "#{product.name} has been removed from your cart."
      redirect_to cart_path
    end
  end
end

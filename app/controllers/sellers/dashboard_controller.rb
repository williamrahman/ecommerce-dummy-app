module Sellers
  class DashboardController < SellerBaseController
    def index
      @products = Product.all
    end
  end
end

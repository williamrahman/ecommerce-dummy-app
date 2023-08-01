module Customers
  class DashboardController < CustomerBaseController
    before_action :authenticate!

    def index
      @products = Cart.all
    end
  end
end

class CustomerBaseController < ApplicationController
  helper_method :current_user 

  def authenticate!
    unless current_user.class == "Customer"
      logins_customers_path
    end
  end

  private

  def current_user
    @current_user ||= Customer.find(session[:user_id]) if session[:user_id]
  end
end

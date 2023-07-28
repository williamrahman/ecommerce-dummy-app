class CustomerBaseController < ApplicationController
  helper_method :current_user 

  private

  def current_user
    @current_user ||= Customer.find(session[:user_id]) if session[:user_id]
  end
end

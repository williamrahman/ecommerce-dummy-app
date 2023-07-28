module Logins
  class CustomersController < ApplicationController
    def new
      @user = Customer.new
    end

    def index

    end

    def create
      @user = Customer.new(user_params)
  
      if @user.save!
        flash[:success] = "User successfully created."
        redirect_to logins_customers_path
      else
        render :new
      end
    end

    def authenticate
      @user = Customer.find_by(email: params[:email])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Logged in successfully."
        redirect_to customers_root_path
      else
        flash[:error] = "Invalid email or password."
      end
    end

    def logout
      session[:user_id] = nil
      flash[:success] = "Logged out successfully."
      redirect_to logins_customers_path
    end

    private

    def user_params
      params.require(:customer).permit(:name, :email, :password, :phone_number, :address)
    end
  end
end

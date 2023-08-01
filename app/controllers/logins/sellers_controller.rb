module Logins
  class SellersController < ApplicationController
    def new
      @user = Seller.new
    end

    def index

    end

    def create
      @user = Seller.new(user_params)
  
      if @user.save!
        flash[:success] = "User successfully created."
        redirect_to logins_sellers_path
      else
        render :new
      end
    end

    def authenticate
      @user = Seller.find_by(email: params[:email])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Logged in successfully."
        redirect_to sellers_root_path
      else
        flash[:error] = "Invalid email or password."
        redirect_to logins_sellers_path
      end
    end

    def logout
      session[:user_id] = nil
      flash[:success] = "Logged out successfully."
      redirect_to '/'
    end

    private

    def user_params
      params.require(:seller).permit(:name, :email, :password, :phone_number, :address)
    end
  end
end

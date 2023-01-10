class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:show_all_carts]

  def index
    @products = Product.all
    @categories = Category.all 
    @user_fav_product_ids = fav_product_ids if user_signed_in?
    @user_fav_product_prices = fav_product_price if user_signed_in?
    @user_fav_products = fav_product_ids if user_signed_in?
  end

  def show_all_carts 
    @products = Product.all
    @user_fav_products = fav_product_ids
    @user_fav_product_prices = fav_product_price 
  end


  def top_users
    @users = User.all
  end

  private

  def fav_product_price
    current_user.user_favourite_products.pluck(:product_price)
  end

  def fav_product_ids
    current_user.user_favourite_products.pluck(:product_id)
  end

end

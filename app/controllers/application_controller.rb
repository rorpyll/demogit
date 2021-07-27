class ApplicationController < ActionController::Base
  before_action :set_search_object, :show_user_carts
  
  def set_search_object
    @q = Product.ransack(params[:q])
  end

  def show_user_carts
    @user_product = current_user.user_favourite_products.count if user_signed_in?
  end
end

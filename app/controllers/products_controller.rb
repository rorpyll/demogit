class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy add_favourite_products remove_favourite_products update_quantity]
  before_action :authenticate_user!, only: [:add_favourite_products, :remove_favourite_products]

  # GET /products or /products.json
  def index
    @products = @q.result(distinct: true)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html {redirect_to @product, notice: 'Product was successfully updated.'}
        format.json {render :show, status: :ok, location: @product}
      else
        format.html {render :edit, status: :unprocessable_entity}
        format.json {render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html {redirect_to products_url, notice: 'Product was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def add_favourite_products
    UserFavouriteProduct.create(user_id: current_user.id, product_id: @product.id, product_price: @product.price, quantity: 1)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Product Add to Fav.' }
    end  
  end

  def remove_favourite_products
    if current_user.user_favourite_products == []
      redirect_to root_path, notice: 'First Add the product then can remove.'
    else
      UserFavouriteProduct.find_by(user_id: current_user.id, product_id: @product.id, product_price: @product.price).destroy
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end
  
  def update_quantity
    UserFavouriteProduct.update(quantity: @quantity)
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def fav_product_price
    current_user.user_favourite_products.pluck(:product_price)
  end


  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:branch_name, :image, :title, :description, :price, :product_type, :model_number)
  end
end

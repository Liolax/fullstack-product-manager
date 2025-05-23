class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    products = Product.all
    if params[:available].present?
      if params[:available] == 'true'
        products = products.where(available: true)
      elsif params[:available] == 'false'
        products = products.where(available: false)
      end
    end
    render json: products
  end

  # GET /products/:id
  def show
    render json: @product
  end

  # POST /products
  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :ok
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    deleted = @product.as_json
    @product.destroy
    render json: deleted, status: :ok
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :available)
  end
end

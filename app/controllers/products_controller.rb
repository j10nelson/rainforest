class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.find(params[:id])
  end

  def new
    @products = Product.new
  end

  def edit
    @products = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def update
    @products = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to product_url(@product)
    else
      render :edit
    end
  end

    def destroy
      @products = Product.find(params[:id])
      @product.destroy
      redirect_to products_url
    end

    private
    def product_params
      params.require(:product).permit(:name, :description, :price_in_cents)
    end
end

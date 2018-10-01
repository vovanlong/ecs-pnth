class Api::V1::ProductsController < ApplicationController
  before_action :load_product, only: :detail
  
  def popular
    
    @product = Product.all.where('avg_star >= ?',5).limit(18)
    product_serializable = parse_json @product
    render json: {product_popular: product_serializable}
  end

  def index
  end

  def detail
    product_serializable = parse_json @product
    render json: {product_detail: product_serializable}
  end
 
  def product_new
    @products = Product.all.order('products.created_at DESC').limit(6)
    new_product = parse_json @products

    render json: {product:new_product}
  end
  
  def related
    @products = Product.find_by_id params[:id]
    @related_products = Product.related_products(@products).limit(3)
    render json: {status: 200, product: (parse_json @related_products)}
  end
  
  
  private
    def load_product
      @product = Product.find_by_id params[:id]
    end
       
end

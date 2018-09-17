class Api::V1::ProductsController < ApplicationController
    
    def popular
      @product = Product.all.where('avg_star >= ?',8)
      product_serializable = parse_json @product
        render json: {product_popular: product_serializable}
    end
    
    def index
    end
    
end

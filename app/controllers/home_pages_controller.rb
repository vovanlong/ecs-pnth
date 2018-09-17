class HomePagesController < ApplicationController
    before_action :load_product_category, only: [:show]
    def index
    end

    def show
      @category = Category.find_by_id params[:id]
    end
    
    def detail
    end
    
    private
      def load_product_category
        @products = Product.where('category_id = ?',params[:id]).paginate(:page => params[:page])
      end
      
      def load_product
      end
      
end

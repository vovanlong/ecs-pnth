module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @category = Category.all.where('parent_id = ?', 0)
        render json: { status:"success", category:  @category}
      end

      def show
        id = params[:id]
        @category_selected = Category.find_by_id id
        @category_parentid = Category.all.where('parent_id = ?', id)
        render json: { status: "success", category_id: @category_parentid, category_selected: @category_selected  }
      end

      def selected
        id = params[:id]
        @product = Product.find_by_id id
        category_id = @product.category_id
        @category_selected = Category.find_by_id category_id
        render json: { status: "success", category_id: @category_selected }
      end
      

      def category_home
        @category = Category.all.where('parent_id = ?', 0)
        category_serializable =  parse_json @category
        render json: { status: "success", category: category_serializable }
      end

      def categoryById
        
        id = params[:id]
        @category = Category.all.where('parent_id = ?', id)
        categoryid_serializable = parse_json @category
        render json: {status: "success", categoryid: categoryid_serializable }
      end
      
    end 
  end
end
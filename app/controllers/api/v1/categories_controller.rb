module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @category = Category.all.where('parent_id = ?', 0)
        render json: { status:"success", category:  @category}
      end

      def show
        id = params[:id]
        @category_parentid = Category.all.where('parent_id = ?', id)
        render json: { status: "success", category_id: @category_parentid }
      end
    end 
  end
end
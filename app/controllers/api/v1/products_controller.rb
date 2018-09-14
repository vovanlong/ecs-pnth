module Api
  module V1
    class ProductsController < ApplicationController
        
      def popular
        render json: {success: "success"}
      end
      
    end
  end
end
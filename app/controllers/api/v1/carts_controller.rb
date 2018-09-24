module Api
  module V1
    class CartsController < ApplicationController
     before_action :logged_in_user
     before_action :load_order, only: :create
      def index
        @carts = OrderDetail.all.where('user_id = ?', request.headers["Authorization"])
        carts_serializer = parse_json @carts
        render json: {cart: carts_serializer}
      end
      
      def create
        @order_detail = OrderDetail.new cart_params
        @order_detail.order_id = @order.id
        @order_detail.user_id =  @order.user_id
        if @order_detail.save!
          render json: {status: 200, order_detail: @order_detail}
        else 
          render json: {status: 400, message: 'thêm vào giỏ hàng thất bại'}
        end
      end
      
      private

        def logged_in_user
          unless request.headers["Authorization"]
            render json: {status: 404, message: 'bạn chưa đăng nhập'}
          end
        end

        def load_order
          @order = Order.find_by user_id: request.headers["Authorization"]
          if @order.nil?
            @order = Order.create(:status => 0,:name=>"", :phone_number=>"",:address=>"", :user_id=> request.headers["Authorization"])
          else
            @order
          end
        end
        

        def cart_params
          params.permit(:quantity, :price, :product_id)
        end
    end
  end
end


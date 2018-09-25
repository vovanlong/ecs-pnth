module Api
  module V1
    class CartsController < ApplicationController
    # before_action :logged_in_user, except: [:remove_product]
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
        @product = Product.find_by_id @order_detail.product_id
        quantity_new = @product.quantity - @order_detail.quantity
        if quantity_new >= 0
          if @order_detail.save!
            @product.update_attributes(:quantity => quantity_new)
            render json: {status: 200, order_detail: @order_detail, message: "Bạn mua sản phẩm #{@order_detail.product.name}"}
          else 
            render json: {status:400, message: "sai roi ban ơi"}
          end
        else 
          render json: {status: 404, message: "trong kho hết rồi mua làm ci"}
        end
        # if @order_detail.save!
        #   @product = Product.find_by_id @order_detail.product_id
          
            
        #   quantity_new = @product.quantity - @order_detail.quantity
        #   if quantity_new > 0
        #     @product.update_attributes(:quantity => quantity_new)
        #   else
        #     render json: {status: 404, message: "Hết hàng rồi bạn ơi"}
        #     return
        #   end
        #   render json: {status: 200, order_detail: @order_detail, message: "Bạn mua sản phẩm #{@order_detail.product.name}"}
        # else 
        #   render json: {status: 400, message: 'thêm vào giỏ hàng thất bại'}
        # end
      end

      def remove_product
        @order_detail = OrderDetail.find_by_id params[:id]
        @product = Product.find_by_id @order_detail.product_id
        quanity = @order_detail.quantity + @product.quantity
        @product.update_attributes(:quantity => quanity)
        @order_detail.destroy
        render json: {status: 200, message: "bạn đã xóa sản phẩm"}
      end

      def add_quantity
        
        
        nguyen = params[:add].to_i
        @order_detail = OrderDetail.find_by_id params[:id]
        @product = Product.find_by_id @order_detail.product_id
        max = nguyen - @order_detail.quantity 
        peter = @product.quantity - max
        
        if @product.quantity > 0
          @order_detail.update_attributes(:quantity => nguyen)
          @product.update_attributes(:quantity => peter)
        else 
          render json: {status: 404, message: "Hết hàng rồi bạn ơi"}
        end
      end

      def remove_quantity
        
        nguyen = params[:rem].to_i
        @order_detail = OrderDetail.find_by_id params[:id]
        @product = Product.find_by_id @order_detail.product_id
        max = @order_detail.quantity - nguyen
        peter =  @product.quantity + max
        if peter >= 0
          @order_detail.update_attributes(:quantity => nguyen)
          @product.update_attributes(:quantity => peter)
        else 
          render json: {status: 404, message: "Hết hàng rồi bạn ơi"}
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


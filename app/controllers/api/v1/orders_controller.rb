class Api::V1::OrdersController < ApplicationController
  before_action :load_order, only: :order
 
  def order
    @order.update_attributes(:name => params[:name],:phone_number => params[:phone_number], :address => params[:address], :status=>1 )
    render json: {status: 200, order: (parse_json @order), message: "Bạn xem thông tin nhận hàng nhé"}
  end

  private

    def load_order
        user_id = request.headers["Authorization"]
        @order = Order.find_by user_id: user_id.to_i
    end
  

    def order_params
        params.permit(:name, :phone_number, :address)
    end
  
end

class Api::V1::OrdersController < ApplicationController
  before_action :load_order, only: :order
 
  def order
    @order.update_attributes(:name => params[:name],:phone_number => params[:phone_number], :address => params[:address], :status=>1 )
    @order_detail = OrderDetail.all.where('order_id=?', @order.id).update_all(status: '1')
    render json: {status: 200, message: "Bạn xem thông tin nhận hàng nhé"}
  end

  def info_order
    @order_info = Order.all.where('user_id= ? AND status = 1', request.headers["Authorization"])
    render json: {status: 200, order: @order_info}
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




class Admin::ProductsController < Admin::BaseController
  before_action :load_product, only: [:edit, :update]
  
  def index
    @products = Product.includes(:photos)
  end
  
  def new
    @product = Product.new
    @category = Category.new
  end
  
  def edit
  end
  
  def create
    @product = current_user.products.build(product_params)
    if @product.save
      if params[:images]
        params[:images].each do |img|
          @product.photos.create(image: img[1])
        end
      end
      flash[:notice] = "Saved ..."
    end
  end

  def update
    name = params[:name]
    description = params[:description]
    price = params[:price]
    quantity = params[:quantity]
    category_id = params[:category_id]
    user_id = current_user.id
    if @product.update_attributes!(:name => name, :description => description, :price => price, :quantity => quantity, :category_id => category_id, :user_id =>user_id)
      if params[:images]
        @product.photos.destroy_all
        params[:images].each do |img|
          @product.photos.create(image: img[1])
        end
      end
    else

    end
  end
  
  
  private

  def product_params
    params.permit(:name, :description,:price,:quantity,:category_id)
  end

  def load_product
    @product = Product.find_by_id params[:id]
  end
end

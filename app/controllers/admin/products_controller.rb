class Admin::ProductsController < Admin::BaseController
  before_action :load_product, only: [:edit]
  def index
    @products = Product.joins(:photos)
    
  end
  
  def new
    @product = Product.new
    @category = Category.new
  end
  
  def edit
  end
  
  def create
    name = params[:name]
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
    
  end
  
  
  private

  def product_params
    params.permit(:name, :description,:price,:quantity,:category_id)
  end

  def load_product
    @product = Product.find_by_id params[:id]
  end
  
  
end

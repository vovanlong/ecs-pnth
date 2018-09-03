class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all.limit(10).includes(:photos)
    
  end
  
  def new
    
    
    @product = Product.new
    @category = Category.list_categories
  end
  
  
  def create
    
    binding.pry
    
    @product = current_user.products.build(product_params)
    if @product.save!
      if params[:images]
        params[:images].each do |img|
          @product.photos.create(image: img)
        end 
      end
    else 
    end
    
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :description,:price,:quantity,:category_id)
  end
  
end

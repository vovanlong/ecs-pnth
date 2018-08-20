class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all.paginate(:page => params[:page])
  end
  
end

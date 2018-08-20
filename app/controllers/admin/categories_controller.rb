class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, only: [:edit, :update, :destroy]

  def index
    @category = Category.new
    @cateory_select =  Category.list_categories.where('parent_id > ?', 0)
    @categories = Category.all.paginate(:page => params[:page])
  end

  def new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:notice] =" Tạo danh mục thành công "
      redirect_to admin_categories_path
    else
      flash[:danger] = t "Thất bại rồi né:)))"
    end
  end
  

  def edit
    @cateory_select =  Category.list_categories.where('parent_id > ?', 0)
  end

  def update
    
    binding.pry
    
    parent_id = params[:category][:parent_id]
    if @category.update_attributes category_params
      if parent_id.empty?
        @category.update_attribute :parent_id ,"0"
      else
        @category.update_attribute :parent_id ,parent_id
      end
      flash[:notice] = "edit thành công"
      redirect_to admin_categories_path
    else 
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "delete category success"
    else
      flash[:danger] = "delete category failded"
    end
    redirect_to admin_categories_path
  end
  
  
  private

  def load_category
    @category = Category.find_by id: params[:id]
  end

  def category_params
    params.require(:category).permit(:name,:description, :parent_id)
  end
end

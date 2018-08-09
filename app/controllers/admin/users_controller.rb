class Admin::UsersController < Admin::BaseController
  
  def index
    
    # binding.pry
    
    @users = User.all.paginate(:page => params[:page])
  end
    
end

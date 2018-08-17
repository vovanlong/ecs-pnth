class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: [:edit, :update, :destroy]
  


  def index
    @users = User.all.paginate(:page => params[:page])
  end
    
  def edit
  end
  
  def update
    
    binding.pry
    
    return render :edit unless @user.update_attributes! user_params
      flash[:success] = "Success update"
      redirect_to admin_users_path
  end

  def destroy
    if @user.present? && @user.destroy
      flash[:notice] = "delete user success"
    else
      flash[:danger] = "delete user failded"
    end
    redirect_to admin_users_path
  end
  
  

  private

    def load_user
      @user = User.find_by id: params[:id]
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone_number)
    end

   
    
end

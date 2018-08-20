class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all.paginate(:page => params[:page])
  end

  def new
    if current_user.role != "admin"
      flash[:error] = "you not admin"
      redirect_to admin_users_path
    else
      @user = User.new
      render 'new'
    end
  end
  
  def create
    @user = User.new user_params
    @user.role = "employees"
    if @user.save
      flash[:notice] = "create user employees"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end
    
  def edit
  end
  
  def update
    return render :edit unless @user.update_attributes user_params
      flash[:success] = "Success update"
      redirect_to admin_users_path
  end

  def destroy
    if current_user.role == "admin"
      if @user.present? && @user.destroy
        flash[:notice] = "delete user success"
      else
        flash[:danger] = "delete user failded"
      end
      redirect_to admin_users_path
    else 
      flash[:danger] = "You not admin"
    end
  end

  private

    def load_user
      @user = User.find_by id: params[:id]
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone_number)
    end
end

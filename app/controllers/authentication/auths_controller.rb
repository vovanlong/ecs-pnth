class Authentication::AuthsController < Authentication::BaseController
  def index
  end

  def new      
    @user = User.new
  end
    
  def create
    
    binding.pry
    
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:notice] = 'Login success'
      redirect_to admin_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
    

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone_number)
    end
    


      
end

class Authentication::SessionsController < Authentication::BaseController
  before_action :load_user, only: [:create]
  
  def new
  end

  def create
    
    binding.pry
    
    
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to admin_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    
    binding.pry
    
    log_out
    flash[:notice] = 'success logout'
    redirect_to login_path
  end
  

  private

    def load_user 
      @user = User.find_by email: params[:session][:email].downcase
    end

end

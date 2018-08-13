class Authentication::SessionsController < Authentication::BaseController
  def new
  end

  def create
    
    binding.pry
    
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    
    binding.pry
    
    log_out
    redirect_to admin_path
  end
  
end

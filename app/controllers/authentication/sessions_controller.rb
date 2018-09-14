class Authentication::SessionsController < Authentication::BaseController
  before_action :load_user, only: [:create]
  
  def new
  end

  def create
    if @user && @user.authenticate(params[:session][:password])
      if @user.role == "admin" || "employees"
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_to admin_path
      else
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_to root_path
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = 'success logout'
    redirect_to login_path
  end
  

  private

    def load_user
      @user = User.find_by email: params[:session][:email].downcase
    end
end

class Admin::BaseController < ApplicationController
    layout "admin/index"
    include SessionsHelper
    before_action :logged_in_user, only: [:index, :edit, :update, :new]
    before_action :loggin_admin, only: :destroy
    # private

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def loggin_admin
      
      binding.pry
      
      unless current_user.role == 1 || 2
        flash[:danger] = "You not admin"
        redirect_to admin_path
      end
    end
end
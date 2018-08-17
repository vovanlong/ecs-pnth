class Admin::BaseController < ApplicationController
    layout "admin/index"
    include SessionsHelper
    before_action :logged_in_user, only: [:index, :edit, :update]
    # private

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
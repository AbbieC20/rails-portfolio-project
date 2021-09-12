class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :require_login, :admin_only, :logged_in
  
    def current_user
      if session[:user_id].present?
        return User.find_by(:id => session[:user_id])
      end
    end
  
    def require_login
      unless current_user
        redirect_to root_url
      end
    end

    def logged_in
      !!session[:user_id] && current_user != nil 
    end
  
    def admin_only
      unless current_user.admin
        flash[:notice] = "You must have Admin Access to perform that function!"
        redirect_to user_path(current_user)
      end
    end
end
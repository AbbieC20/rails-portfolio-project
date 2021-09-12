class SessionController < ApplicationController 

    def new
      @user = User.new
    end
  
    def create
      if params[:provider] === "github"
        nickname = request.env['omniauth.auth']["info"]["nickname"]
        @user = User.find_by(name: nickname)
        if @user.nil? 
          @user = User.create(name: nickname, password: "CreatedbyOAuth", location: "N/A", admin: false)
        end
        session[:user_id] = @user.id
        session[:omniauth_data] = request.env['omniauth.auth']
        redirect_to root_url
      elsif params[:name] != nil
        @user = User.find_by(name: params[:name])
        session[:user_id] = @user.id
        redirect_to root_url
      else
        render 'new'
      end
    end
  
    def destroy
        session.delete :user_id
        redirect_to root_url
    end

    private
  
    def auth
      request.env['omniauth.auth']
    end

end
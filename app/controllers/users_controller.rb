class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def index
      if params[:event_id]
        @event = Event.find(params[:event_id])
        @users = @event.users
      end
    end

    def new
      @user = User.new
    end
  
    def create
      if !User.find_by(name: user_params[:name]).nil? 
        redirect_to signin_url
        flash[:notice] = "You already have an account! Please sign in using the below form."
      else 
        user = User.create(user_params)
        if user.valid?
          session[:user_id] = user.id
          redirect_to root_url
        else 
          render :new
        end 
      end
    end
    
    def show
      @user = User.find_by(id: params[:id])
    end
  
  
    private
  
    def user_params
      params.require(:user).permit(:name, :location, :admin, :password)
    end
  end

class LoginController < ApplicationController
  
  def login
    end
    
    def registration
    end
    
    
  def logi
      users = User.find_by_user_name_and_password(params[:users][:user_name],params[:users][:password])

        if !users.blank?
          redirect_to :controller => 'home' ,:action => 'index'
        else
          render :action => 'login'
        end
    end
    
    def create
      @users=User.new(params[:users])
        if @users.save
          redirect_to :action => "login"
        else
          render :action => "registration"
        end
    end
end

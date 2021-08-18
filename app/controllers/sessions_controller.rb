class SessionsController < ApplicationController

    def new

    end

    def create
      user = User.find_by_email(params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to sandwiches_path
      else
        flash[:message] = "Invalid Credentials"
        redirect_to login_path
      end
    end

    def omniauth
      
      user = User.find_or_create_by(uid: auth['uid']) do |u|
        
        u.email = auth["info"]["email"]
        u.password = SecureRandom.hex(7)
      end
      if user.valid?
        session[:user_id] = user.id
        flash[:message] = "Login Successful"
        redirect_to sandwiches_path
      else
        redirect_to login_path
      end
    end

    def destroy
      session.delete(:user_id)
      redirect_to orders_path
    end
  
    private

    def auth
      request.env['omniauth.auth']
    end

  end 
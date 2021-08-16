class SessionsController < ApplicationController

    def new

    end

    def create

    end

    def omniauth
      user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
        u.email = auth['info']['email']
        u.username = auth['info']['name']
        u.password = SecureRandom.hex(7)
      end
      if user.valid?
        sessions[:user_id] = user.id
        flash[:message] = "Login Successful"
        redirect_to orders_path
      else

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
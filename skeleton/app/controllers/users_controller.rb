class UsersController < ApplicationController
    before_action :require_logout, only: [:new, :create]
    before_action :require_login, only: [:destroy]

    def new 
        render :new 
    end

    def create
        user = User.new(username: params[:user][:username], password: params[:user][:password])
        if user.save! 
            login_user!(user)
            redirect_to cats_url
        else
            flash[:errors] 
            redirect_to new_user_url
        end
    end
end

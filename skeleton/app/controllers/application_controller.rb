class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :curr_user, :logged_in?

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        curr_user.reset_session_token! if curr_user
        session[:session_token] = nil
    end

    def curr_user
        @curr_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!curr_user
    end

    def require_logout        
        redirect_to cats_url if logged_in?
    end

    def require_login       
        redirect_to new_session_url if !logged_in?
    end
end

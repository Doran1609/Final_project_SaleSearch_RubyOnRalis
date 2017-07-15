class UserController < ApplicationController
    def login
    end
    
    def admin_login
        session[:login] = 1
        session[:cart] = nil
        flash[:notice] = "Admin login Successful!!!"
        redirect_to :controller => :companies
    end
    
    def logout
        session[:login] = nil
        session[:cart] = nil
        flash[:notice] = "You have been successfully logged out !!!"
        redirect_to :controller => :companies
    end
end
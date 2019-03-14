class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception  
    helper_method :check_email
 


    def check_email
      User.where(email: session[:checkuser_email]).first
    end
   

    private   
    def current_user   
      User.where(id: session[:checkuser_id] ).first   
    end   
    helper_method :current_user   
    
end

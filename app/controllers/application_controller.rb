class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception  
    helper_method :check_email
    helper_method :flash_class
    helper_method :current_user
 
    def flash_class(level)
      case level
        when 'notice' then "alert alert-success alert-dismissible"
        when 'success' then "alert alert-success alert-dismissible"
        when 'error' then "alert alert-error alert-dismissible"
        when 'alert' then "alert alert-error alert-dismissible"
        when 'danger' then "alert alert-danger alert-dismissible"
      end
    end
  
    def check_email
      User.where(email: session[:checkuser_email]).first
    end
   
    private   
    def current_user   
      User.where(id: session[:checkuser_id] ).first   
    end   
        
end

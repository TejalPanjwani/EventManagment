class SessionsController < ApplicationController
    def login
      #login page 
      @user = User.new
    end
  
    def create
      #for login
      @user = User.new( params.require(:user).permit(:email,:password))
        if User.exists?(:email => @user.email) #check email exists or not
            @checkuser = User.where("email=?", @user.email)
            if @checkuser[0].password == @user.password #if email exists than check password
                session[:checkuser_id] = @checkuser[0].id
                if @checkuser[0].role == "user"
                    #user login
                    flash[:success] = "You are successfully loged in !!!"
                    redirect_to viewservices_users_path
                elsif @checkuser[0].role == "serviceprovider"
                    #serviceprovider login
                    @data = Requestforsevice.find_by("user_id=?",session[:checkuser_id])
                    flash[:success] = "You are successfully loged in !!!"
                    redirect_to viewrespons_serviceproviders_path(@data)
                elsif @checkuser[0].role == "admin"
                    #admin login
                    flash[:success] = "You are successfully loged in !!!"
                    redirect_to admin_mainpage_path
                end
            else 
                flash[:danger] = "Password mismatch"
                render 'login'
            end
        else
            flash[:danger] = "Invalide email and password"
            render 'login'
        end
    end

    def destroy
      #for logout
      session[:checkuser_id] = nil   
      #reset_session #wipe out session and everything in it
      flash[:success] = "You are successfully loged out !!!"
      redirect_to users_path
    end
  end
  
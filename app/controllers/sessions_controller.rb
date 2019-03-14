class SessionsController < ApplicationController
    def login
      #login 
    end
  
    def create
      @user = User.new( params.require(:users).permit(:email,:password))
        if User.exists?(:email => @user.email)
            #binding.pry
            @checkuser = User.where("email=?", @user.email)
            if @checkuser[0].password == @user.password
                session[:checkuser_id] = @checkuser[0].id
                if @checkuser[0].role == "user"
                    redirect_to viewservices_users_path

                elsif @checkuser[0].role == "serviceprovider"
                    @data = Requestforsevice.find_by("user_id=?",session[:checkuser_id])
                    redirect_to viewrespons_serviceproviders_path(@data)

                elsif @checkuser[0].role == "admin"
                    #binding.pry
                    redirect_to admin_mainpage_path
                end
            else 
                render 'login'
            end
        else
            render 'login'
        end
    end

    def destroy
      session[:checkuser_id] = nil   
      #reset_session #wipe out session and everything in it
      redirect_to users_path
    end
  end
  
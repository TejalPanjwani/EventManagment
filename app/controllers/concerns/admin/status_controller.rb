class Admin::StatusController < Admin::BaseController


    def index
        #two link login and register
        #@users = User.all
    end


    def mainpage
        #show all links of all tables
    end

    def requestpage
        #show all request
        @requests = Requestforsevice.all 
    end

    def serviceproviderpage
        #show all service provider
        @serviceproviders = User.where("role=?", 1)
        
    end

    def userspage
        #show all users
        @users = User.where("role=?", 0)
    end

    def servicetypes
        #show all title
        @titles = Title.all
    end

    def servicepage
        #show all services
        @s = Service.all
    end

    def citypage
        #show all cities
        @citys = City.all
    end

    def register
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.typeofhuman = nil
        if @user.save 
            @u = User.last
            @u.role="admin"
            if @u.save
                redirect_to sessions_login_path
            else 
                render 'register'
            end
        else
            render 'register'
        end

    end

    def servicestatuts
        @r = Requestforsevice.find(params[:id])
    end

    def acceptservice

        #update statutsofservice  rejectservice to acceptservice
        @r = Requestforsevice.find(params[:id])
        @r.status = "acceptservice"
        @r.save

        redirect_to admin_requestpage_path
    end

    def rejectservice
        #not update anything
        @r = Requestforsevice.find(params[:id])
        @r.status = "rejectservice"
        @r.save
        redirect_to admin_requestpage_path

    end

    private
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
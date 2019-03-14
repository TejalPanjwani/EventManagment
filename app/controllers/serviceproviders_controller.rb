class ServiceprovidersController < ApplicationController
    def viewrespons
        @data = Requestforsevice.find(params[:id])
    end

    def addservices
        #add service form to display
        @service =Service.new
    end

    def showservice
        #show all service 
        @service = Service.where("user_id=?",current_user.id)
        #binding.pry
    end

    def create
        #add services into db
        @service =Service.new(serviceprovider_params)

        # render json: params
        # return
        @service.takeuserid(session[:checkuser_id])
        if @service.save
            redirect_to  serviceprovider_path(@service)
        else
            render 'addservices'
        end

    end

    def profile
        @user = User.find(current_user.id)
    end

    def show
        #add service than this is called
        @service = Service.find_by("id=?",params[:id])
        @city = City.find(@service.city_id)
        @title = Title.find(@service.title_id)
    end

    def edit
        if current_user
            @user = User.find(current_user.id)
        else
            redirect_to  sessions_login_path
        end
    end

    def update
        @user = User.find(current_user.id)
        if @user.update(user_params)
            redirect_to profile_serviceproviders_path(@user)
        else
            render 'edit'
        end
    end

    def destroy
        @service = Service.find_by("id=?",params[:id])
        @service.destroy
        redirect_to showservice_serviceproviders_path(Service.where("user_id=?",current_user.id))
    end

    def showuserservice
        @service = Service.find_by("id=?",params[:id])
        @city = City.find(@service.city_id)
        @title = Title.find(@service.title_id)
    end

    def editservice
        #edit service 
        if current_user
            #binding.pry
            # @service =  Service.where("user_id=?",current_user.id).first
            @service =  Service.find_by(id: params[:id])


        else
            redirect_to  sessions_login_path
        end

    end

    def updateservice
        #update service
        @service =  Service.where("user_id=?",current_user.id)
        if @service.update(edit_service_params.merge(:title=> Title.find(@service[0].title_id).title_name))
            redirect_to showservice_serviceproviders_path(@service)
        else
            render 'editservice'
        end

    end




    private
    def serviceprovider_params
        params.require(:service).permit(:title,:nameofsevice,:city,:address,:contact,:service_image,:description)
    end

    def user_params
        params.require(:user).permit(:name,:email)
    end

    def edit_service_params
        params.require(:service).permit(:nameofsevice,:city,:address,:contact,:description)
    end
end

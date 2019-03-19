class UsersController < ApplicationController

    def register
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:checkuser_email] = @user.email
            if @user.typeofhuman=="book services"
                #go on login page
                UserMailer.send_to_user(@user).deliver_now
                redirect_to  sessions_login_path
            elsif @user.typeofhuman=="add services"
                #go on description page
                redirect_to description_users_path
            end
        else 
            render 'register'
        end
    end

    def description
        @request  = Requestforsevice.new
       
    end

    def viewservices
        #types all 
        
    end

    def addDescription
        #post method add into db
        
        @request  = Requestforsevice.new(requestforsevice_params.merge(:check_email=> check_email.email))
       
        if @request.save
            UserMailer.send_to_serviceprovider(check_email).deliver_now
            session[:checkuser_email] = nil
            redirect_to sessions_login_path

        else
            render 'description'
        end
    end


    def banquetpage

        #@search = Service.new
        @t = Title.where("title_name=?","Banquet Hall").last
        
        if @t 
            if params[:users]
                @s = (params[:users][:search]).to_s if params[:users][:search].present?
                #@service = Service.where("title_id=?",@t.id).by_search(params[:users][:search])
                @services = Service.by_title(@t.id).by_search(params[:users][:search]) if params[:users][:search].present?

                #binding.pry
                @services = Service.by_title(@t.id).by_sort_date("updated_at") if params[:users][:sortby]=="by latest upload"
                @services = Service.by_title(@t.id).by_sort("nameofsevice") if params[:users][:sortby]=="by name"

                #@service = Service.by_search(params[:users][:search]) if params[:users][:search].present?
                #@services = Service.where("title_id=?",@t.id).where("address like ?", "%#{params[:users][:search]}%" )
                #@students = Student.where("name like ?", "%#{params[:users][:search]}%").or(Student.where("address like ?","%#{params[:users][:search]}%"))
            else
                @services = Service.where("title_id=?",@t.id)
            end
        else 
            @services=nil
        end
       
    end



    # def banquetpage
    #     @t = Title.where("title_name=?","Banquet Hall").last
    #     if @t 
    #         @services = Service.where("title_id=?",@t.id)
    #     else 
    #         @services=nil
    #     end
       
    # end


    def ceteringpage
        @t = Title.where("title_name=?","Cetering").last


        if @t 
            if params[:users]
                @s = (params[:users][:search]).to_s if params[:users][:search].present?
                #@service = Service.where("title_id=?",@t.id).by_search(params[:users][:search])
                @services = Service.by_title(@t.id).by_search(params[:users][:search]) if params[:users][:search].present?

                #binding.pry
                @services = Service.by_title(@t.id).by_sort_date("updated_at") if params[:users][:sortby]=="by latest upload"
                @services = Service.by_title(@t.id).by_sort("nameofsevice") if params[:users][:sortby]=="by name"

                #@service = Service.by_search(params[:users][:search]) if params[:users][:search].present?
                #@services = Service.where("title_id=?",@t.id).where("address like ?", "%#{params[:users][:search]}%" )
                #@students = Student.where("name like ?", "%#{params[:users][:search]}%").or(Student.where("address like ?","%#{params[:users][:search]}%"))
            else
                @services = Service.where("title_id=?",@t.id)
            end
        else 
            @services=nil
        end
       

        # if @t 
        #     @services = Service.where("title_id=?",@t.id)
        # else 
        #     @services=nil
        # end
       
    end

    def decorationpage
        @t = Title.where("title_name=?","Decoretion").last

        if @t 
            if params[:users]
                @s = (params[:users][:search]).to_s if params[:users][:search].present?
                #@service = Service.where("title_id=?",@t.id).by_search(params[:users][:search])
                @services = Service.by_title(@t.id).by_search(params[:users][:search]) if params[:users][:search].present?

                #binding.pry
                @services = Service.by_title(@t.id).by_sort_date("updated_at") if params[:users][:sortby]=="by latest upload"
                @services = Service.by_title(@t.id).by_sort("nameofsevice") if params[:users][:sortby]=="by name"

                #@service = Service.by_search(params[:users][:search]) if params[:users][:search].present?
                #@services = Service.where("title_id=?",@t.id).where("address like ?", "%#{params[:users][:search]}%" )
                #@students = Student.where("name like ?", "%#{params[:users][:search]}%").or(Student.where("address like ?","%#{params[:users][:search]}%"))
            else
                @services = Service.where("title_id=?",@t.id)
            end
        else 
            @services=nil
        end
       


        # if @t 
        #     @services = Service.where("title_id=?",@t.id)
        # else 
        #     @services=nil
        # end
       
    end

    def musicpage
        @t = Title.where("title_name=?","Music").last


        if @t 
            if params[:users]
                @s = (params[:users][:search]).to_s if params[:users][:search].present?
                #@service = Service.where("title_id=?",@t.id).by_search(params[:users][:search])
                @services = Service.by_title(@t.id).by_search(params[:users][:search]) if params[:users][:search].present?

                #binding.pry
                @services = Service.by_title(@t.id).by_sort_date("updated_at") if params[:users][:sortby]=="by latest upload"
                @services = Service.by_title(@t.id).by_sort("nameofsevice") if params[:users][:sortby]=="by name"

                #@service = Service.by_search(params[:users][:search]) if params[:users][:search].present?
                #@services = Service.where("title_id=?",@t.id).where("address like ?", "%#{params[:users][:search]}%" )
                #@students = Student.where("name like ?", "%#{params[:users][:search]}%").or(Student.where("address like ?","%#{params[:users][:search]}%"))
            else
                @services = Service.where("title_id=?",@t.id)
            end
        else 
            @services=nil
        end
       


        # if @t 
        #     @services = Service.where("title_id=?",@t.id)
        # else 
        #     @services=nil
        # end
       
    end

    def partyplotpage
        @t = Title.where("title_name=?","Party Plot").last


        if @t 
            if params[:users]
                @s = (params[:users][:search]).to_s if params[:users][:search].present?
                #@service = Service.where("title_id=?",@t.id).by_search(params[:users][:search])
                @services = Service.by_title(@t.id).by_search(params[:users][:search]) if params[:users][:search].present?

                #binding.pry
                @services = Service.by_title(@t.id).by_sort_date("updated_at") if params[:users][:sortby]=="by latest upload"
                @services = Service.by_title(@t.id).by_sort("nameofsevice") if params[:users][:sortby]=="by name"

                #@service = Service.by_search(params[:users][:search]) if params[:users][:search].present?
                #@services = Service.where("title_id=?",@t.id).where("address like ?", "%#{params[:users][:search]}%" )
                #@students = Student.where("name like ?", "%#{params[:users][:search]}%").or(Student.where("address like ?","%#{params[:users][:search]}%"))
            else
                @services = Service.where("title_id=?",@t.id)
            end
        else 
            @services=nil
        end
       
        


        # if @t 
        #     @services = Service.where("title_id=?",@t.id)
        # else 
        #     @services=nil
        # end
       
    end

    def viewmore
        @service = Service.find(params[:id])
    end


    private
    def user_params
        params.require(:user).permit(:name,:typeofhuman,:email,:password,:password_confirmation)
    end
    def requestforsevice_params
     
        params.require(:requestforsevice).permit(:description)
    end 
end

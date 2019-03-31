class BooknotifyservicesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def book
       @books =  Book.where("user_id=?",current_user.id)
    end

    def create
        @book =Book.new("guestdata"=>params["guestdata"],"daydata"=>params["daysdata"],"bugetdata"=>params["bugetdata"],"calldata"=>params["calldata"],"service_id"=>params[:book][:serviceid],"user_id"=>current_user.id,"contact"=>params["contact"])
        if @book.save
            @user = Service.find(@book.service_id).user_id
            @notice = Notice.new(user_id: @user , book_id: @book.id)
            if @notice.save
                redirect_to  new_booknotifyservice_path
            end
        end 
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:success]="your booking successfully cancle"
        redirect_to book_booknotifyservices_path
    end

    private
    def books_params
        params.require().permit("guestdata","daydata","bugetdata","calldata","service_id")
        binding.pry
    end
end 
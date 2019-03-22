class BooknotifyservicesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def book
       @books =  Book.where("user_id=?",current_user.id)
    end

    def create
        @book =Book.new("guestdata"=>params["guestdata"],"daydata"=>params["daysdata"],"bugetdata"=>params["bugetdata"],"calldata"=>params["calldata"],"service_id"=>params[:book][:serviceid],"user_id"=>current_user.id)
        binding.pry
        @book.save
        redirect_to  new_booknotifyservice_path 
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
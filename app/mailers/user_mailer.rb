class UserMailer < ApplicationMailer


    def send_to_user(user)
        @user = user
        mail(to: @user.email,from: "tejalpanjwani97@gmail.com",subject:"demo",message:"heyyyyyy") 

    end

    def send_to_serviceprovider(user)
        @service = user
        mail(to: @service.email,from: "tejalpanjwani97@gmail.com",subject:"demo",message:"heyyyyyy") 


    end

end

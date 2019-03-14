class Requestforsevice < ApplicationRecord
    belongs_to :user, optional: true
    enum status: [:penddingservice,:rejectservice, :acceptservice]
    validates :description, length: { minimum: 5  }
    before_save :take_human_id
    after_save :change_role
    #attr_accessor :email

    attr_accessor :check_email

    private
    def take_human_id
        #email nil go to else
        #when ever we update status this before_save call
        #update status we dont use email so email is nil and go else do nothing
        if check_email
            @request = User.find_by(email: check_email)
            self.user_id = @request.id
        else
        end


    end

    def change_role
      #email nil go to else
      #when ever we update status this after_save call
      #update status we dont use email so email is nil and go else do nothing
      if check_email
        @request = User.find_by(email: check_email)
        @request.role = "serviceprovider"
        @request.save
      else
      end

    end

    # private
    # def take_human_id
    #     #email nil go to else
    #     #when ever we update status this before_save call
    #     #update status we dont use email so email is nil and go else do nothing
    #     if email
    #         @request = User.find_by(email: email)
    #         self.user_id = @request.id
    #     else
    #     end

    # end
    # def change_role
    #   #email nil go to else
    #   #when ever we update status this after_save call
    #   #update status we dont use email so email is nil and go else do nothing
    #   if email
    #       @request = User.find_by(email: email)
    #       @request.role = "serviceprovider"
    #       @request.save
    #   else
    #   end

    # end


end

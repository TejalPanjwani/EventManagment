class Book < ApplicationRecord
  belongs_to :service
  belongs_to :user

  def servicename(id)
    Service.find(id).nameofsevice
  end

end

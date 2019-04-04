class Book < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_one :notice, dependent: :destroy

  def servicename(id)
    Service.find(id).nameofsevice
  end

end

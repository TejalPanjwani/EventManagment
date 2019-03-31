class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum statustype: [:unread,:read]

  def service_name(id)
    Service.find(id).nameofsevice
  end
end

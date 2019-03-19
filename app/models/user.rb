class User < ApplicationRecord
    has_many :services, dependent: :destroy
    has_many :requestforsevices, dependent: :destroy
    enum role: [:user,:serviceprovider,:admin]

    validates :password, confirmation: { case_sensitive: true }
    validates :email, uniqueness: true
    validates_format_of :password, :with => /\A((?=.*[A-Z])(?=.*[a-z])(?=.*[@#$%^&*()])(?=.*[0-9])(?!.*\s)).{8,15}\z/ , message:"it should contain 1 cappital letter 1 lower letter 1 digit 1 special charecter and length between 8 to 15"
    validates_format_of :name , :with =>/\A[A-Z][a-z]*\z/ ,message:"start with capital letter " #only for name start with capital letter
    validates_format_of :email, :with => /\A([\w\-\.]+)@([\w\-\.]+)\.([a-zA-Z]{2,5})\z/i
    validates_presence_of :typeofhuman, :message => "can't be empty"
    #validates :typeofhuman, :presence=> { :message => "type can't blank" }
end

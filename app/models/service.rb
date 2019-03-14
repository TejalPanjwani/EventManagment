class Service < ApplicationRecord
    has_one_attached :service_image
    belongs_to :city, optional: true
    belongs_to :title, optional: true
    belongs_to :user, optional: true
    
    validates :nameofsevice,:address, presence: true
    validates :description, length: { minimum: 5  }
    validates_format_of :contact, :with => /\A(\d{8}|\d{10})\z/i,  message: "length must be 8 or 10"


    #scope :by_search, -> name{ where(name: name)  if name.present? } 
    scope :by_search, -> name{ where("address like ?", "%#{name}%" ) }
    scope :by_title, -> id{ where("title_id=?",id) }
    scope :by_sort, -> sortname{  order(:"#{sortname}") }
    scope :by_sort_date, -> sortdate{  order("#{sortdate}": :desc) }



    
    def resizeimage
        self.service_image.variant(resize: '190x190')
    end

    def viewin
        self.service_image.variant(resize: '490x490')
    end


    before_save :ensure_title_and_city_id
    attr_accessor :title,:city


    def checkstatuts(id)
        @check = Requestforsevice.find_by("user_id=?",id)
        @check.status

    end

    def printtitle(id)
        #print title_name on admin side
        Title.find(id).title_name
    end
    def printcity(id)
        #print city_name on admin side
        City.find(id).city_name
    end
    def printuser(id)
        #print user name on admin side
        User.find(id).name
    end

    def takeuserid(id)
        self.user_id = id
    end
    
    private
    def ensure_title_and_city_id
        @t = Title.find_by("title_name=?",title)
        self.title_id  =@t.id
        


        if City.exists?(:city_name => city)
            @data = City.find_by_city_name(city)
        else
            @data = City.create(city_name: city)
        end
          self.city_id = @data.id 
    end  

end

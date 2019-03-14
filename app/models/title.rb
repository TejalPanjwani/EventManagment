class Title < ApplicationRecord
    has_many :services
    LIST = Title.all.collect{|t| t.title_name}
end

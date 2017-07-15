class Item < ActiveRecord::Base
  belongs_to :company
  
    def self.search(search)
        where("name LIKE ?", "%#{search}%")
    end

end

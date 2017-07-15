class Company < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 50 }
    validates :image, presence: true, length: { minimum: 3, maximum: 50 }
    has_many :items
    
    def self.search(search)
        where("name LIKE ?", "%#{search}%")
    end

end

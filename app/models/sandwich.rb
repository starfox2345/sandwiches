class Sandwich < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders
    belongs_to :category

    accepts_nested_attributes_for :category

    validates :ingredient, presence: true
    validates :price, numericality: {greater_than: 0, lesser_than: 100}
    validates :category, presence: true, uniqueness: true


    
    def category_attributes=(hash_of_attributes)
        if !hash_of_attributes["name"].blank?
            self.category = Category.find_or_create_by(hash_of_attributes)
        end
    end
    


    def name_ingredient
        "#{self.category.name} - #{self.ingredient}"
    end



end

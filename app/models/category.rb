class Category < ApplicationRecord
    has_many :sandwiches
    

    # def sandwich_attributes=(hash_of_attributes)
    #     if !hash_of_attributes["name"].blank?
    #         self.sandwich = Category.find_or_create_by(hash_of_attributes)
    #     end
    # end

    accepts_nested_attributes_for :sandwiches
    
    validates :name, presence: true, uniqueness: {scope: [:name]}, length: {minimum: 2, message: "needs to be longer than 2 letters"}

end
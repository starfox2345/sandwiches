class Category < ApplicationRecord
    has_many :sandwiches
    
    validates :name, presence: true, uniqueness: {scope: [:name]}, length: {minimum: 2, message: "needs to be longer than 2 letters"}

end
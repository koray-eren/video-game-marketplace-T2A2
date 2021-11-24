class Listing < ApplicationRecord
    has_one_attached :image
    belongs_to :user

    validates :name, :description, :functional_condition, :cosmetic_condition ,:image, presence: true
    validates :price, :cosmetic_condition, :functional_condition, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :cosmetic_condition, :functional_condition, numericality: {less_than_or_equal_to: 3 }
    
end
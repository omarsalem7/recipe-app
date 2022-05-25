class Recipe < ApplicationRecord
    has_many :recipe_foods
    has_many :foods, through: :recipe_foods 
end

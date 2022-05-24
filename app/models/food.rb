class Food < ApplicationRecord
  belongs_to :user

  validates :name, :measurement_unit, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

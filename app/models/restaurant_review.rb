class RestaurantReview < ApplicationRecord
  belongs_to :author

  validates :review,
    numericality: { only_integer: true },
    inclusion: { in: [1, 2, 3, 4, 5] }
end

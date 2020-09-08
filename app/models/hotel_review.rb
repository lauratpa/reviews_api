class HotelReview < ApplicationRecord
  belongs_to :author

  validates :review, length: { minimum: 10 }
end

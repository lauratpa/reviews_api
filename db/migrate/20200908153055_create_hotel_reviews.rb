class CreateHotelReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_reviews do |t|
      t.string :review, null: false
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end

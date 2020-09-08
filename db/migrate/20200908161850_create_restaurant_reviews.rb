class CreateRestaurantReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_reviews do |t|
      t.integer :review, null: false
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end

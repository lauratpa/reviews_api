joe = Author.find_or_create_by!(name: "Joe")
jill = Author.find_or_create_by!(name: "Jill")
Author.find_or_create_by!(name: "Jack")
Author.find_or_create_by!(name: "Jane")

HotelReview.find_or_create_by!(author: joe, review: "Very good indeed")
HotelReview.find_or_create_by!(author: jill, review: "The best pizza ever")

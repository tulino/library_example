class Review < ApplicationRecord
  belongs_to :book, optional: true, foreign_key: "book_id"
  belongs_to :user, optional: true, foreign_key: "user_id"
end

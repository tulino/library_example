class Deposit < ApplicationRecord
  belongs_to :user
  belongs_to :book

  after_create :change_method
  after_update :change_method

  def change_method
   @book = Book.find(self.book_id)
   if @book.state == true
     @book.state = false
   else
     @book.state = true
   end
  end
end

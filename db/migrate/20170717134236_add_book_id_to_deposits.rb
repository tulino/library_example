class AddBookIdToDeposits < ActiveRecord::Migration[5.1]
  def change
    add_column :deposits, :book_id, :integer
  end
end

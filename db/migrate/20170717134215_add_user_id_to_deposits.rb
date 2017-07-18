class AddUserIdToDeposits < ActiveRecord::Migration[5.1]
  def change
    add_column :deposits, :user_id, :integer
  end
end

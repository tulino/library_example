class CreateDeposits < ActiveRecord::Migration[5.1]
  def change
    create_table :deposits do |t|
      t.date :deposit_date
      t.date :deadline
      t.date :due_date
      t.timestamps
    end
  end
end

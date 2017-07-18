class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :page_count
      t.references :author, index: true, foreign_key: true
      t.boolean :state

      t.timestamps
    end
  end
end

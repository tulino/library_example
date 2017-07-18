class CreateAuthorsCategoriesJoins < ActiveRecord::Migration[5.1]
  def self.up
    create_table :authors_categories, :id => false do |t|
      t.integer :author_id
      t.integer :category_id
    end
    add_index :authors_categories, [:author_id, :category_id]
  end

  def self.down
    drop_taable :authors_categories

  end
end

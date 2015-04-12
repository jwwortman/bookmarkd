class CreateBookshelves < ActiveRecord::Migration
  def change
    create_table :bookshelves do |t|
      t.integer :book_id
      t.integer :shelf_id
      t.timestamps null: false
    end
    add_index :bookshelves, [:book_id, :shelf_id]
  end
end

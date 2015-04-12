class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.integer :book_id
      t.integer :library_id
      t.timestamps null: false
    end
    add_index :catalogs, [:book_id, :library_id]
  end
end

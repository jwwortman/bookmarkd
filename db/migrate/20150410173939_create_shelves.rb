class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.string :name
      t.text :description
      t.references :library, index: true

      t.timestamps null: false
    end
    add_foreign_key :shelves, :libraries
    add_index :shelves, [:library_id, :created_at]
  end
end
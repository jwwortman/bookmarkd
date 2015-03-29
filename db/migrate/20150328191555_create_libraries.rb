class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :library_name
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :libraries, :users
  end
end

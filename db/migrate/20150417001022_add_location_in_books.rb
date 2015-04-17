class AddLocationInBooks < ActiveRecord::Migration
  def change
    add_column :books, :location, :string
  end
end

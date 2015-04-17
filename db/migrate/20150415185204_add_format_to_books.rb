class AddFormatToBooks < ActiveRecord::Migration
  def change
    add_column :books, :format, :string
  end
end

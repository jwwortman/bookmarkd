class ChangeLibraryNameColumnToName < ActiveRecord::Migration
  def change
    rename_column :libraries, :library_name, :name
  end
end

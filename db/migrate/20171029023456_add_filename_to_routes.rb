class AddFilenameToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :filename, :string
  end
end

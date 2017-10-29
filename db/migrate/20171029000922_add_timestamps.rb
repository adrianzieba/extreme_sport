class AddTimestamps < ActiveRecord::Migration[5.1]
  def up
    Route.destroy_all
    add_timestamps(:routes)
  end

  def down
    remove_column :routes, :created_at
    remove_column :routes, :updated_at
  end
end

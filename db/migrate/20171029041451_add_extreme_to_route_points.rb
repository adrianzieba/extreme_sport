class AddExtremeToRoutePoints < ActiveRecord::Migration[5.1]
  def change
    add_column :route_points, :extreme, :boolean
  end
end

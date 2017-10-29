class ChangeColumnRoutePoints < ActiveRecord::Migration[5.1]
  def change
    change_column :route_points, :lat, "numeric USING lat::numeric(15,13)"
    change_column :route_points, :lon, "numeric USING lat::numeric(15,13)"
  end
end

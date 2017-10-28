class CreateRoutePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :route_points do |t|
      t.string :lat
      t.string :lon
      t.integer :order
    end

    add_reference :route_points, :route, index: true, foreign_key: true
  end
end

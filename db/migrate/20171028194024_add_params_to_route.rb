class AddParamsToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :prosthesis, :boolean
    add_column :routes, :crutches, :boolean
    add_column :routes, :wheelchair_tetraplegia, :boolean
    add_column :routes, :wheelchair_paraplegia, :boolean
  end
end

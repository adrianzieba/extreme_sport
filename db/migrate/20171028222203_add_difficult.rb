class AddDifficult < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :difficult_level, :integer, default: 0, null: false
  end
end

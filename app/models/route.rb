class Route < ApplicationRecord
  has_many :route_points, dependent: :destroy
end

class RoutePoint < ApplicationRecord
  belongs_to :route
  acts_as_mappable :default_units => :miles,
                 :lat_column_name => :lat,
                 :lng_column_name => :lon
end

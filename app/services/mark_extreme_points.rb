class MarkExtremePoints
  def initialize(points)
    @points = points
  end

  def perform
    points.each do |point|
      RoutePoint.where(lat: point['lat'], lon: point['lon']).update_attributes(extreme: true)
    end
  end

  private
  attr_reader :points
end

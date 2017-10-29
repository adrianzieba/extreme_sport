class MarkExtremePoints
  def initialize(points)
    @points = points
  end

  def perform
    points.each do |point|
      RoutePoint.within(0.01, :origin => [point['lat'],point['lon']]).each do |rp|
        rp.update_attributes(extreme: true)
      end
    end
  end

  private
  attr_reader :points
end

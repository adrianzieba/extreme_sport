class RouteCreator
  def initialize(file_name)
    @file_name = file_name
  end

  def perform
    route = Route.create(
      author: metadata.fetch('author').fetch('name'),
      name: trk.fetch('name')
    )

    trk["trkseg"]["trkpt"].each_with_index do |point, index|
      RoutePoint.create(lat: point["lat"], lon: point["lon"], order: index, route_id: route.id)
    end
  end

  private
  attr_reader :file_name

  def trk
    gpx.fetch('trk')
  end

  def metadata
    gpx.fetch('metadata')
  end

  def gpx
    hash.fetch("gpx")
  end

  def hash
    @hash ||= Hash.from_xml(File.open(file_name, 'r').read)
  end
end

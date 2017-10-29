class RouteCreator
  def initialize(file_name)
    @file_name = file_name
  end

  def perform
    route = Route.create(
      author: metadata.fetch('author', {}).fetch('name', nil),
      name: trk.fetch('name'),
      filename: file_name
    )

    trk["trkseg"]["trkpt"].each_with_index do |point, index|
      RoutePoint.create(lat: point["lat"], lon: point["lon"], order: index, route_id: route.id)
    end
    route
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

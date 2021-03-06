module HashData
  class Route
    def initialize(route_id:)
      @route_id = route_id
    end

    def perform
      route_attributes.merge(
        points: route.route_points.order(:order).map(&:attributes)
      )
    end

    private
    attr_reader :route_id

    def route_attributes
      route.attributes.slice("name", "author", "prosthesis", "crutches", "wheelchair_tetraplegia", "wheelchair_paraplegia", "difficult_level")
    end

    def route
      ::Route.find(route_id)
    end
  end
end

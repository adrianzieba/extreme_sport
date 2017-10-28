module HashData
  class Route
    def initialize(route_id: route_id)
      @route = route
    end

    def perform
      {

      }
    end

    private
    attr_reader :route_id

    def route
      Route.find(route_id)
    end
  end
end

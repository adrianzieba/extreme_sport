class RouteUpdater
  def initialize(params:)
    @params = params
  end

  def perform
    route.update_attributes!(attributes)
  end

  private
  attr_reader :params

  def attributes
    {
      prosthesis: params['prosthesis'],
      crutches: params['crutches'],
      wheelchair_tetraplegia: params['wheelchair_tetraplegia'],
      wheelchair_paraplegia: params['wheelchair_paraplegia'],
      difficult_level: params['difficult_level']
    }
  end

  def route
    @route ||= Route.find(params['id'])
  end
end

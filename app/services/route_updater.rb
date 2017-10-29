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
      wheelchair_tetraplegia: params['wheelchairTetraplegia'],
      wheelchair_paraplegia: params['wheelchairParaplegia'],
      difficult_level: params['difficultLevel']
    }
  end

  def route
    @route ||= Route.find(params['id'])
  end
end
